Automation Templates
====================

Create a VPC, Subnets, and IAM Roles
------------------------------------

To expedite the deployment of new member accounts, several cloud formation templates have been created and are currently in use at the NCCoE.

This `example CloudFormation template <https://github.com/usnistgov/ACMVPDocs/blob/main/Infrastructure/cloudFormation-example.yml>`__ deploys VPCs, Subnets, and IAM Roles across one Availability Zone and is a combination of many smaller templates.

Automated Rotation of Console Access Keys
-----------------------------------------

The NCCoE uses `Axonious <https://www.axonius.com/>`__ for continuous visibility in the AWS environment. The access keys used by the service are automatically rotated in accordance with Security best practices.

An `example CloudFormation template <https://github.com/usnistgov/ACMVPDocs/blob/main/Infrastructure/access_key_rotation_example.yml>`__ for rotating the access keys assigned to a service within AWS can be found in the ACMVP Documentation repository.

Notification of Member Account Changes
--------------------------------------

The NCCoE notifies security personnel of all member account changes automatically to ensure awareness.

An `example CloudFormation template <https://github.com/usnistgov/ACMVPDocs/blob/main/Infrastructure/account_event_notification_example.yml>`__ for sending email notifications to security personnel for each account creation, removal, suspension, or assignment event can be found in the ACMVP Documentation repository. Because this approach uses AWS's Simple Notification Service (SNS), this template can be modified to send notifications to other destinations, depending on the use case.

Deny Quad Zeros
---------------

The NCCoE regularly audits security groups for quad zeros using an SSM Automation Document that runs on a schedule. This document includes a trust policy configuration designed to prevent Confused Deputy attacks.

An `example CloudFormation Template <https://github.com/usnistgov/ACMVPDocs/blob/main/Infrastructure/deny_quad_zeroes_example.yml>`__ for creating an SSM Automation Document and an IAM Role for the purposes of regularly auditing AWS security groups can be found in the ACMVP Documentation repository. A second CloudFormation template is also available to demonstrate the `creation of a custom maintenance window <https://github.com/usnistgov/ACMVPDocs/blob/main/Infrastructure/maintenance_window_example.yml>`__.

Create Transit Gateway Attachments
----------------------------------

The NCCoE developed an automated approach to quickly deploy new AWS lab infrastructure. As part of this automation, a new AWS Transit Gateway Attachment (TGA) can be created, configured, and deployed with minimal overhead. With a TGW in place, Transit Gateway Attachments (TGAs) can be used to connect networks to VPCs that are located within the AWS infrastructure.

An `example automation script <https://github.com/usnistgov/ACMVPDocs/blob/main/Infrastructure/create_tga_example.sh>`__ to create and configure Transit Gateway Attachments using the AWS CLI can be found in the ACMVP Documentation Repository.

Automated Application Build Templates
-------------------------------------

The NCCoE has developed scripts and procedures for automated application builds and deployments using AWS CodeBuild and CodePipeline. This approach enables consistency and repeatability during the build process and accelerates testing and troubleshooting processes related to application builds. AWS CodePipeline interacts with CodeBuild automation to provision Kubernetes configurations and deploy container images from Amazon Elastic Container Registry (ECR) to Amazon Elastic Kubernetes Service (EKS) clusters.

The automated build process uses a combination of Taskfiles and Terraform scripts to simplify the build process and push container images into the Amazon ECR.

`This repository <https://github.com/usnistgov/ACMVPDocs/tree/main/Infrastructure/taskfile_terraform_example>`__ contains example templates that demonstrate the automated application build and deployment processes.

All templates and scripts covered are available on the `ACMVP Documentation Repository <https://github.com/usnistgov/ACMVPDocs/blob/main/README.md>`__.
