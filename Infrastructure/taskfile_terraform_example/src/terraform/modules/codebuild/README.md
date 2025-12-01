# CodeBuild Module

This Terraform module provisions an AWS CodeBuild project with flexible configuration options for building, testing, and deploying applications. It supports VPC integration for private resource access, custom build images, and dynamic environment variable injection.

## Features

- **Flexible Build Environments**: Support for various compute types and custom Docker images
- **VPC Integration**: Optional VPC configuration for accessing private resources (e.g., EKS clusters, RDS databases)
- **Privileged Mode**: Docker-in-Docker support for container image builds
- **Custom Buildspecs**: Reference external buildspec files for reusable build configurations
- **Dynamic Environment Variables**: Inject environment-specific variables at runtime
- **No Artifacts Mode**: Designed for pipeline integration where artifacts are managed by CodePipeline

## Prerequisites

Before using this module, ensure you have:

- IAM role with appropriate permissions for CodeBuild
- Buildspec file(s) defining your build steps
- (Optional) VPC, subnets, and security groups if VPC integration is required
- (Optional) ECR repository access if building and pushing container images

## Usage

### Basic Build Project

```hcl
module "codebuild_app" {
  source = "./modules/codebuild"

  project_name    = "my-app-build"
  iam_role_arn    = aws_iam_role.codebuild.arn
  buildspec_path  = "buildspecs/app-build.yml"
  
  environment_variables = {
    APP_ENV = "production"
    REGION  = "us-east-1"
  }
}
```

### Docker Image Build with Privileged Mode

```hcl
module "codebuild_docker" {
  source = "./modules/codebuild"

  project_name    = "my-app-docker-build"
  iam_role_arn    = aws_iam_role.codebuild.arn
  buildspec_path  = "buildspecs/docker-build.yml"
  privileged_mode = true
  
  environment_variables = {
    ECR_REPOSITORY = "123456789012.dkr.ecr.us-east-1.amazonaws.com/my-app"
    IMAGE_TAG      = "latest"
  }
}
```

### VPC-Enabled Build for Kubernetes Deployment

```hcl
module "codebuild_k8s_deploy" {
  source = "./modules/codebuild"

  project_name   = "my-app-k8s-deploy"
  iam_role_arn   = aws_iam_role.codebuild.arn
  buildspec_path = "buildspecs/k8s-deploy.yml"
  compute_type   = "BUILD_GENERAL1_LARGE"
  
  vpc_config = {
    vpc_id             = "vpc-abc123"
    subnet_ids         = ["subnet-123", "subnet-456"]
    security_group_ids = ["sg-789"]
  }
  
  environment_variables = {
    EKS_CLUSTER_NAME = "my-eks-cluster"
    NAMESPACE        = "production"
    KUBECTL_VERSION  = "1.33"
  }
}
```

### Custom Build Image

```hcl
module "codebuild_custom" {
  source = "./modules/codebuild"

  project_name   = "my-app-custom-build"
  iam_role_arn   = aws_iam_role.codebuild.arn
  buildspec_path = "buildspecs/custom-build.yml"
  build_image    = "aws/codebuild/standard:7.0"
  compute_type   = "BUILD_GENERAL1_SMALL"
  
  environment_variables = {
    NODE_VERSION = "20"
    CUSTOM_VAR   = "value"
  }
}
```

### Multiple Build Projects for Pipeline

```hcl
# Frontend build
module "codebuild_frontend" {
  source = "./modules/codebuild"

  project_name   = "app-frontend-build"
  iam_role_arn   = aws_iam_role.codebuild.arn
  buildspec_path = "buildspecs/frontend-build.yml"
  compute_type   = "BUILD_GENERAL1_SMALL"
  
  environment_variables = {
    NODE_ENV = "production"
  }
}

# Backend build
module "codebuild_backend" {
  source = "./modules/codebuild"

  project_name   = "app-backend-build"
  iam_role_arn   = aws_iam_role.codebuild.arn
  buildspec_path = "buildspecs/backend-build.yml"
  privileged_mode = true
  
  environment_variables = {
    ECR_REPO = "my-backend-repo"
  }
}

# Deployment
module "codebuild_deploy" {
  source = "./modules/codebuild"

  project_name   = "app-deploy"
  iam_role_arn   = aws_iam_role.codebuild.arn
  buildspec_path = "buildspecs/deploy.yml"
  
  vpc_config = {
    vpc_id             = module.vpc.vpc_id
    subnet_ids         = module.vpc.private_subnets
    security_group_ids = [aws_security_group.codebuild.id]
  }
  
  environment_variables = {
    CLUSTER_NAME = module.eks.cluster_name
  }
}
```

## Variables

### Required Variables

| Name | Type | Description |
|------|------|-------------|
| `iam_role_arn` | `string` | ARN of the IAM role for CodeBuild |
| `project_name` | `string` | Name of the CodeBuild project |

### Optional Variables

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `build_image` | `string` | `"aws/codebuild/amazonlinux2-x86_64-standard:5.0"` | CodeBuild Docker image to use for builds |
| `buildspec_path` | `string` | `"buildspecs/default/buildspec.yml"` | Path to the buildspec file (relative to Terraform root) |
| `compute_type` | `string` | `"BUILD_GENERAL1_MEDIUM"` | CodeBuild compute type (SMALL, MEDIUM, LARGE, 2XLARGE) |
| `environment_variables` | `map(string)` | `{}` | Additional environment variables for CodeBuild |
| `privileged_mode` | `bool` | `true` | Enable privileged mode for Docker builds |
| `vpc_config` | `object` | `null` | VPC configuration settings for accessing private resources |

#### VPC Config Object Structure

```hcl
vpc_config = {
  vpc_id             = string        # VPC ID
  subnet_ids         = list(string)  # List of subnet IDs
  security_group_ids = list(string)  # List of security group IDs
}
```

## Outputs

| Name | Description |
|------|-------------|
| `project_arn` | ARN of the CodeBuild project |
| `project_id` | ID of the CodeBuild project |
| `project_name` | Name of the CodeBuild project |
| `service_role` | Service role ARN used by the CodeBuild project |

## Architecture Notes

### Artifact Configuration

This module uses `NO_ARTIFACTS` configuration, which is optimal for:
- Integration with CodePipeline (artifacts managed by pipeline)
- Build projects that publish directly to registries (ECR, Docker Hub)
- Deployment projects that apply changes directly to infrastructure

If you need artifact outputs, consider extending the module or managing artifacts through CodePipeline.

### Build Environment

The module uses `LINUX_CONTAINER` environment type with configurable:
- **Compute Types**: Available options
  - `BUILD_GENERAL1_SMALL`: 3 GB memory, 2 vCPUs
  - `BUILD_GENERAL1_MEDIUM`: 7 GB memory, 4 vCPUs (default)
  - `BUILD_GENERAL1_LARGE`: 15 GB memory, 8 vCPUs
  - `BUILD_GENERAL1_2XLARGE`: 144 GB memory, 72 vCPUs

- **Build Images**: Common options
  - `aws/codebuild/amazonlinux2-x86_64-standard:5.0` (default)
  - `aws/codebuild/standard:7.0` (Ubuntu-based)
  - Custom ECR images

### Privileged Mode

Privileged mode is enabled by default (`true`) to support Docker-in-Docker builds. This is required for:
- Building Docker images
- Running Docker Compose
- Any Docker daemon operations

Set to `false` if not building containers to follow least-privilege principles.

### VPC Integration

When `vpc_config` is provided, CodeBuild runs within your VPC, enabling access to:
- Private EKS cluster API endpoints
- RDS databases without public access
- Private API endpoints
- Internal services and resources

**Important**: VPC-enabled builds require:
- NAT Gateway or VPC endpoints for internet access
- Security group rules allowing outbound traffic
- Subnets with available IP addresses

### Source Configuration

The module uses `NO_SOURCE` type with inline buildspec file reference. This design:
- Allows buildspec files to be version-controlled separately
- Enables reusable build configurations across projects
- Works seamlessly with CodePipeline source stages

CodePipeline provides the source code, while the buildspec file defines build steps.

## Buildspec File Structure

Your buildspec file should follow AWS CodeBuild syntax:

```yaml
version: 0.2

phases:
  pre_build:
    commands:
      - echo Logging in to Amazon ECR...
      - aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $ECR_REPOSITORY
  
  build:
    commands:
      - echo Build started on `date`
      - docker build -t $IMAGE_TAG .
      - docker tag $IMAGE_TAG:latest $ECR_REPOSITORY:$IMAGE_TAG
  
  post_build:
    commands:
      - echo Build completed on `date`
      - docker push $ECR_REPOSITORY:$IMAGE_TAG
```

## IAM Requirements

The IAM role specified in `iam_role_arn` must have permissions to:

### Basic Permissions
- CloudWatch Logs (for build logs)
- S3 (if using CodePipeline artifacts)

### For Docker Builds
- ECR authentication and push permissions

### For VPC Builds
- Create and manage ENIs
- Describe VPC resources

### For EKS Deployments
- EKS cluster access
- kubectl operations via EKS API

Example minimal policy:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ec2:CreateNetworkInterface",
        "ec2:DescribeNetworkInterfaces",
        "ec2:DeleteNetworkInterface",
        "ec2:DescribeSubnets",
        "ec2:DescribeSecurityGroups",
        "ec2:DescribeDhcpOptions",
        "ec2:DescribeVpcs",
        "ec2:CreateNetworkInterfacePermission"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:PutImage",
        "ecr:InitiateLayerUpload",
        "ecr:UploadLayerPart",
        "ecr:CompleteLayerUpload"
      ],
      "Resource": "*"
    }
  ]
}
```

## Important Notes

1. **Buildspec File Location**: The `buildspec_path` is relative to your Terraform root directory. Ensure the file exists before applying.

2. **VPC Configuration**: When using VPC config, builds will run inside your VPC. Ensure:
   - Subnets have internet access (via NAT Gateway or VPC endpoints)
   - Security groups allow necessary outbound traffic
   - ENI limits are not exceeded in the subnets

3. **Privileged Mode**: Required for Docker operations but increases security risk. Disable if not building containers.

4. **Environment Variables**: Sensitive values should use AWS Secrets Manager or Parameter Store instead of plain text.

5. **Compute Type**: Choose based on build requirements:
   - SMALL: Simple builds, small codebases
   - MEDIUM: Most standard builds (default)
   - LARGE: Heavy builds, large monorepos
   - 2XLARGE: Very large builds, parallel operations

6. **CodePipeline Integration**: This module is designed to work with CodePipeline. Source code comes from pipeline, not from CodeCommit or other sources.

## Common Use Cases

### Building and Pushing Docker Images

```hcl
module "docker_build" {
  source = "./modules/codebuild"

  project_name    = "my-docker-build"
  iam_role_arn    = aws_iam_role.codebuild.arn
  buildspec_path  = "buildspecs/docker-build.yml"
  privileged_mode = true
  compute_type    = "BUILD_GENERAL1_MEDIUM"
  
  environment_variables = {
    AWS_ACCOUNT_ID = data.aws_caller_identity.current.account_id
    AWS_REGION     = var.aws_region
    IMAGE_REPO     = "my-app"
  }
}
```

### Kubernetes Deployments

```hcl
module "k8s_deploy" {
  source = "./modules/codebuild"

  project_name   = "k8s-deploy"
  iam_role_arn   = aws_iam_role.codebuild_eks.arn
  buildspec_path = "buildspecs/k8s-deploy.yml"
  
  vpc_config = {
    vpc_id             = var.vpc_id
    subnet_ids         = var.private_subnet_ids
    security_group_ids = [aws_security_group.codebuild_eks.id]
  }
  
  environment_variables = {
    CLUSTER_NAME     = var.cluster_name
    CLUSTER_ENDPOINT = var.cluster_endpoint
    NAMESPACE        = "production"
  }
}
```

### Running Tests

```hcl
module "test_runner" {
  source = "./modules/codebuild"

  project_name    = "app-test-runner"
  iam_role_arn    = aws_iam_role.codebuild.arn
  buildspec_path  = "buildspecs/run-tests.yml"
  compute_type    = "BUILD_GENERAL1_SMALL"
  privileged_mode = false
  
  environment_variables = {
    TEST_ENV = "ci"
  }
}
```

## Resources Created

- `aws_codebuild_project.main` - CodeBuild project

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| aws | >= 5.0 |

## Troubleshooting

### Build fails with VPC connectivity issues

- Verify NAT Gateway or VPC endpoints are configured
- Check security group outbound rules
- Ensure subnets have available IP addresses
- Review VPC flow logs for dropped packets

### Docker build fails

- Ensure `privileged_mode = true` is set
- Verify ECR permissions in IAM role
- Check Docker daemon is starting correctly in logs

### Cannot access EKS cluster

- Verify VPC configuration allows access to EKS API endpoint
- Check EKS access entries include CodeBuild role
- Ensure security groups allow traffic to EKS control plane

### Buildspec file not found

- Verify `buildspec_path` is correct and relative to Terraform root
- Ensure file exists before running `terraform apply`
- Check file permissions and git tracking