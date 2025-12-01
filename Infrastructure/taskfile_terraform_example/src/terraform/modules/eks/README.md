# EKS Cluster Module

This Terraform module provisions an Amazon Elastic Kubernetes Service (EKS) cluster with support for both EKS Auto Mode and traditional node group configurations.

## Features

- **EKS Auto Mode Support**: Simplified cluster management with automated compute, storage, and load balancing
- **FIPS-Compliant Node Groups**: Uses Bottlerocket FIPS-validated AMIs for enhanced security
- **Flexible Access Control**: Supports both public and private API endpoint configurations
- **CodeBuild Integration**: Built-in access management for CI/CD pipelines
- **Load Balancer Integration**: Optional target group attachment for node instances
- **Enhanced Security**: Configurable security group rules for VPC endpoints and ALB traffic

## Prerequisites

Before using this module, ensure you have:

- AWS VPC with properly tagged subnets (see [Subnet Tagging Requirements](#subnet-tagging-requirements))
- IAM roles for EKS cluster and worker nodes
- Security groups for remote access, ALB service traffic, and VPC endpoints
- (Optional) Application Load Balancer target group for service exposure

## Usage

### Basic Configuration with Auto Mode

```hcl
module "eks_cluster" {
  source = "./modules/eks"

  cluster_name           = "my-eks-cluster"
  cluster_version        = "1.33"
  cluster_iam_role_arn   = aws_iam_role.eks_cluster.arn
  node_iam_role_arn      = aws_iam_role.eks_nodes.arn
  
  subnet_ids             = ["subnet-abc123", "subnet-def456"]
  vpc_id                 = "vpc-xyz789"
  
  auto_mode              = true
  enable_default_ng      = false
  
  eks_remote_access_sg   = aws_security_group.eks_remote.id
  alb_service_sg         = aws_security_group.alb.id
  vpc_endpoint_sg        = aws_security_group.vpc_endpoints.id
}
```

### Configuration with Default Node Group

```hcl
module "eks_cluster" {
  source = "./modules/eks"

  cluster_name           = "my-eks-cluster"
  cluster_version        = "1.33"
  cluster_iam_role_arn   = aws_iam_role.eks_cluster.arn
  node_iam_role_arn      = aws_iam_role.eks_nodes.arn
  
  subnet_ids             = ["subnet-abc123", "subnet-def456"]
  vpc_id                 = "vpc-xyz789"
  
  auto_mode              = false
  enable_default_ng      = true
  
  node_group_desired_size = 2
  node_group_min_size     = 1
  node_group_max_size     = 4
  node_group_instance_class = "t3.medium"
  
  eks_remote_access_sg   = aws_security_group.eks_remote.id
  alb_service_sg         = aws_security_group.alb.id
  vpc_endpoint_sg        = aws_security_group.vpc_endpoints.id
}
```

### With CodeBuild Integration and Target Group

```hcl
module "eks_cluster" {
  source = "./modules/eks"

  cluster_name           = "my-eks-cluster"
  cluster_iam_role_arn   = aws_iam_role.eks_cluster.arn
  node_iam_role_arn      = aws_iam_role.eks_nodes.arn
  
  subnet_ids             = ["subnet-abc123", "subnet-def456"]
  vpc_id                 = "vpc-xyz789"
  
  enable_default_ng      = true
  
  # CodeBuild access
  codebuild_role_arn     = aws_iam_role.codebuild.arn
  
  # Target group attachment
  target_group_arn       = aws_lb_target_group.eks_nodes.arn
  target_group_port      = 30043
  node_group_instance_list = module.eks_cluster.node_group_instance_ids
  
  eks_remote_access_sg   = aws_security_group.eks_remote.id
  alb_service_sg         = aws_security_group.alb.id
  vpc_endpoint_sg        = aws_security_group.vpc_endpoints.id
}
```

## Subnet Tagging Requirements

Subnets must be tagged appropriately for Kubernetes to discover them:

### Required Tags for All Subnets
```
"kubernetes.io/cluster/${var.cluster_name}" = "shared"
```

### Public Subnets (for external load balancers)
```
"kubernetes.io/role/elb" = "1"
```

### Private Subnets (for internal load balancers)
```
"kubernetes.io/role/internal-elb" = "1"
```

## Variables

### Required Variables

| Name | Type | Description |
|------|------|-------------|
| `alb_service_sg` | `string` | Security group that permits inbound service traffic to EKS |
| `cluster_iam_role_arn` | `string` | The ARN of the IAM role for the EKS cluster |
| `cluster_name` | `string` | The name of the EKS cluster |
| `eks_remote_access_sg` | `string` | Security group that permits remote access traffic to EKS |
| `node_iam_role_arn` | `string` | The ARN of the IAM role for the EKS worker nodes |
| `subnet_ids` | `list(string)` | A list of subnet IDs to launch the cluster and worker nodes in |
| `vpc_endpoint_sg` | `string` | Security group that permits access to VPC endpoint services required for EKS |
| `vpc_id` | `string` | Target VPC ID where resources will be deployed and managed |

### Optional Variables

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `auto_mode` | `bool` | `true` | Determines if EKS cluster is running in Auto Mode or not |
| `cluster_version` | `string` | `"1.33"` | The Kubernetes version for the EKS cluster |
| `codebuild_role_arn` | `string` | `""` | IAM role ARN for CodeBuild that needs EKS cluster admin access |
| `enable_default_ng` | `bool` | `false` | Enables a default node group that's used to deploying EKS workloads |
| `node_group_desired_size` | `number` | `1` | The desired number of worker nodes |
| `node_group_instance_class` | `string` | `"t3.medium"` | Instance class size for default nodes in EKS cluster |
| `node_group_instance_list` | `list(string)` | `[]` | A list of node group (EC2) instance ids for target group attachment |
| `node_group_max_size` | `number` | `2` | The maximum number of worker nodes |
| `node_group_min_size` | `number` | `1` | The minimum number of worker nodes |
| `private_access` | `bool` | `true` | Indicates which access modes for Amazon EKS private API server endpoint are enabled |
| `target_group_arn` | `string` | `""` | ARN of the target group to attach EKS node instances to |
| `target_group_port` | `number` | `30043` | Port number to use when attaching instances to the target group |

## Outputs

| Name | Description |
|------|-------------|
| `cluster_endpoint` | The endpoint for your EKS Kubernetes API |
| `cluster_name` | The name of the EKS cluster |
| `cluster_security_group_id` | The default security group for the EKS cluster |
| `node_group_id` | The ID of the EKS node group (null if default node group is disabled) |
| `node_group_instance_ids` | List of instance IDs from the node group. Use these values to populate `node_group_instance_list` variable for target group attachment |

## Architecture Notes

### EKS Auto Mode vs Traditional Node Groups

**Auto Mode** (`auto_mode = true`):
- Enables automated compute, storage, and load balancing management
- Uses system and general-purpose node pools
- Disables bootstrap self-managed addons
- Recommended for simplified cluster operations

**Traditional Node Groups** (`auto_mode = false`, `enable_default_ng = true`):
- Uses Bottlerocket FIPS-validated AMIs (`BOTTLEROCKET_x86_64_FIPS`)
- Provides fine-grained control over node configuration
- Supports SSH access via configured key pair
- Enables automatic node repair

### Network Configuration

- **Service CIDR**: Set to `172.20.0.0/16` to avoid conflicts with 10.x ranges
- **API Endpoint Access**:
  - Private access always enabled
  - Public access controlled via `private_access` variable

### Security

The module configures the following security group rules:

1. **VPC Endpoint Access**: Allows cluster members to access VPC endpoints on port 443
2. **ALB Traffic**: Permits all inbound traffic from ALB security group to cluster (required for NodePort services)

### CodeBuild Integration

When `codebuild_role_arn` is provided, the module:
- Creates an EKS access entry for the CodeBuild role
- Associates the `AmazonEKSClusterAdminPolicy` for full cluster administrative access
- Enables CI/CD pipelines to manage cluster resources

## Important Notes

1. **Target Group Attachment**: The `node_group_instance_list` variable creates a dependency loop. To use this feature:
   - First deploy without target group attachment
   - Retrieve instance IDs from `node_group_instance_ids` output
   - Update configuration with instance IDs and redeploy

2. **Node Lifecycle**: The default node group uses `create_before_destroy` lifecycle policy to ensure zero-downtime updates

3. **SSH Access**: Node group uses the `eks-infrastructure-fips` SSH key pair. Ensure this key exists in your AWS account

## Examples

See the [Usage](#usage) section above for complete examples.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| aws | >= 5.0 |

## Resources Created

- `aws_eks_cluster.main` - EKS cluster
- `aws_eks_node_group.default` - Optional managed node group
- `aws_eks_access_entry.codebuild` - Optional CodeBuild access entry
- `aws_eks_access_policy_association.codebuild_admin` - Optional CodeBuild policy association
- `aws_security_group_rule.allow_collection_to_vpc_endpoint_tcp_443` - VPC endpoint access rule
- `aws_security_group_rule.allow_collection_to_eks_any_tcp` - ALB traffic access rule
- `aws_lb_target_group_attachment.node_group` - Optional target group attachments