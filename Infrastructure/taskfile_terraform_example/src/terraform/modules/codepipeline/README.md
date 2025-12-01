# CodePipeline Module

This Terraform module provisions an AWS CodePipeline with three stages: Source, Build, and Deploy. It supports multiple parallel build actions and deploy actions, making it suitable for microservices architectures and complex deployment workflows.

## Features

- **Multi-Action Build Stage**: Supports multiple parallel build actions for building different components simultaneously
- **Multi-Action Deploy Stage**: Supports multiple parallel deployment actions
- **CodeStar Connection Integration**: Seamless integration with GitHub, GitLab, or Bitbucket repositories
- **Automatic Artifact Management**: Creates and manages S3 bucket for pipeline artifacts with versioning enabled
- **Flexible Configuration**: Easy to customize build and deploy actions through list variables

## Prerequisites

Before using this module, ensure you have:

- AWS CodeStar connection configured for your source repository
- IAM role with appropriate permissions for CodePipeline
- CodeBuild projects created for each build and deploy action
- Source repository (GitHub, GitLab, or Bitbucket) accessible via CodeStar connection

## Usage

### Basic Configuration

```hcl
module "codepipeline" {
  source = "./modules/codepipeline"

  pipeline_name             = "my-app-pipeline"
  repository_name           = "my-org/my-repository"
  branch_name               = "main"
  codestar_connection_arn   = "arn:aws:codestar-connections:us-east-1:123456789012:connection/abc-123"
  iam_role_arn              = aws_iam_role.codepipeline.arn

  build_actions = [
    "my-app-frontend-build",
    "my-app-backend-build"
  ]

  deploy_actions = [
    "my-app-deploy-staging"
  ]
}
```

### Multi-Service Microservices Pipeline

```hcl
module "codepipeline" {
  source = "./modules/codepipeline"

  pipeline_name             = "microservices-pipeline"
  repository_name           = "mycompany/microservices-monorepo"
  branch_name               = "main"
  codestar_connection_arn   = var.codestar_connection_arn
  iam_role_arn              = aws_iam_role.codepipeline.arn

  build_actions = [
    "auth-service-build",
    "api-gateway-build",
    "user-service-build",
    "notification-service-build"
  ]

  deploy_actions = [
    "k8s-deploy-staging",
    "k8s-deploy-production"
  ]
}
```

### Feature Branch Pipeline

```hcl
module "feature_pipeline" {
  source = "./modules/codepipeline"

  pipeline_name             = "my-app-pipeline-feature-auth"
  repository_name           = "my-org/my-repository"
  branch_name               = "feature/authentication"
  codestar_connection_arn   = var.codestar_connection_arn
  iam_role_arn              = aws_iam_role.codepipeline.arn

  build_actions = [
    "my-app-build-dev"
  ]

  deploy_actions = [
    "my-app-deploy-dev"
  ]
}
```

## Variables

### Required Variables

| Name | Type | Description |
|------|------|-------------|
| `codestar_connection_arn` | `string` | Connection ARN for git repo through CodeStar |
| `iam_role_arn` | `string` | ARN of the IAM role for CodePipeline |
| `repository_name` | `string` | Name of the source repository in `owner/repo` format (e.g., `myorg/myrepo`) |

### Optional Variables

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `branch_name` | `string` | `"main"` | Branch name to monitor for changes |
| `build_actions` | `list(string)` | `["acmvp-eks-build-webpublic-main", "acmvp-eks-build-nginx-main", "acmvp-eks-build-mqp-main"]` | List of CodeBuild project names for the Build stage |
| `deploy_actions` | `list(string)` | `["acmvp-eks-k8s-deploy"]` | List of CodeBuild project names for the Deploy stage |
| `pipeline_name` | `string` | `"acmvp-eks-pipeline-main"` | Name of the CodePipeline (also used as S3 artifact bucket name) |

## Outputs

| Name | Description |
|------|-------------|
| `artifacts_bucket_arn` | ARN of the artifact S3 bucket |
| `artifacts_bucket_name` | Name of the artifact S3 bucket |
| `pipeline_arn` | ARN of the CodePipeline |
| `pipeline_id` | ID of the CodePipeline |
| `pipeline_name` | Name of the CodePipeline |

## Pipeline Stages

### Stage 1: Source

Monitors the specified branch of your repository for changes. When a commit is pushed, the pipeline automatically triggers.

- **Provider**: CodeStarSourceConnection
- **Output**: `source_output` artifact containing repository contents

### Stage 2: Build

Executes multiple CodeBuild projects in parallel. Each build action receives the source code and produces its own output artifact.

- **Provider**: CodeBuild
- **Input**: `source_output` artifact
- **Output**: `{action_name}_output` artifact for each build action
- **Parallel Execution**: All build actions run simultaneously

### Stage 3: Deploy

Executes multiple deployment CodeBuild projects in parallel. Each deploy action receives the source code and can access build artifacts if needed.

- **Provider**: CodeBuild
- **Input**: `source_output` artifact
- **Output**: `{action_name}_output` artifact for each deploy action
- **Parallel Execution**: All deploy actions run simultaneously

## Architecture Notes

### Artifact Storage

The module automatically creates an S3 bucket for storing pipeline artifacts:
- Bucket name matches the `pipeline_name` variable
- Versioning is enabled to maintain artifact history
- All pipeline stages store their outputs in this bucket

### Action Naming Convention

Build and deploy actions reference existing CodeBuild project names. Ensure these projects exist before creating the pipeline:

```hcl
# Example: CodeBuild projects should exist
resource "aws_codebuild_project" "frontend_build" {
  name = "my-app-frontend-build"
  # ... configuration
}

# Then reference in pipeline
module "codepipeline" {
  # ...
  build_actions = [
    aws_codebuild_project.frontend_build.name
  ]
}
```

### Parallel Execution

Both Build and Deploy stages support parallel execution of multiple actions:
- Build actions execute simultaneously, reducing overall build time
- Deploy actions can target multiple environments or clusters concurrently
- Each action produces independent output artifacts

## IAM Requirements

The IAM role specified in `iam_role_arn` must have permissions to:

- Access the CodeStar connection
- Read/write to the S3 artifact bucket
- Start CodeBuild projects specified in build and deploy actions
- Pass the role to CodePipeline service

Example minimal IAM policy:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "codestar-connections:UseConnection"
      ],
      "Resource": "arn:aws:codestar-connections:*:*:connection/*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "codebuild:BatchGetBuilds",
        "codebuild:StartBuild"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:GetBucketLocation",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::pipeline-artifact-bucket",
        "arn:aws:s3:::pipeline-artifact-bucket/*"
      ]
    }
  ]
}
```

## Important Notes

1. **S3 Bucket Naming**: The S3 artifact bucket uses the same name as `pipeline_name`. Ensure this name is globally unique across AWS.

2. **CodeBuild Project Dependencies**: All CodeBuild projects referenced in `build_actions` and `deploy_actions` must exist before creating the pipeline.

3. **CodeStar Connection**: The CodeStar connection must be in `AVAILABLE` status. Connections require manual approval in the AWS Console on first creation.

4. **Artifact References**: The Deploy stage receives `source_output` as input. If deploy actions need build artifacts, they must be configured to access them from S3 directly using the artifact bucket.

5. **Stage Execution**: Build stage completes only when all build actions succeed. Deploy stage waits for Build stage completion before executing.

## Common Use Cases

### Single Application with Multiple Environments

```hcl
module "codepipeline" {
  source = "./modules/codepipeline"

  pipeline_name = "my-app-pipeline"
  # ... other required variables

  build_actions = [
    "my-app-build"
  ]

  deploy_actions = [
    "my-app-deploy-dev",
    "my-app-deploy-staging",
    "my-app-deploy-prod"
  ]
}
```

### Monorepo with Multiple Services

```hcl
module "codepipeline" {
  source = "./modules/codepipeline"

  pipeline_name = "monorepo-pipeline"
  # ... other required variables

  build_actions = [
    "service-a-build",
    "service-b-build",
    "service-c-build",
    "shared-library-build"
  ]

  deploy_actions = [
    "k8s-deploy-all-services"
  ]
}
```

## Resources Created

- `aws_s3_bucket.artifacts` - S3 bucket for pipeline artifacts
- `aws_s3_bucket_versioning.artifacts` - Versioning configuration for artifact bucket
- `aws_codepipeline.main` - CodePipeline with Source, Build, and Deploy stages

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| aws | >= 5.0 |

## Examples

See the [Usage](#usage) section above for complete examples.

## Troubleshooting

### Pipeline fails to start

- Verify CodeStar connection is in `AVAILABLE` status
- Ensure IAM role has necessary permissions
- Check that all referenced CodeBuild projects exist

### Build/Deploy actions fail

- Review CloudWatch logs for the specific CodeBuild project
- Verify CodeBuild projects have correct source and artifact configurations
- Check that CodeBuild service role has necessary permissions

### Artifact access issues

- Ensure CodeBuild projects have permission to access the artifact S3 bucket
- Verify S3 bucket policy allows CodePipeline and CodeBuild access
- Check that artifact names match between stages