Identity and Access Management
==============================

The NCCoE leverages the on-premises Active Directory service as the authoritative identity source to authenticate and access the AWS research cloud environment.

Active Directory Integration
----------------------------

AWS-managed AD
________________

The NCCoE deployed an `AWS-managed AD <https://docs.aws.amazon.com/directoryservice/latest/admin-guide/directory_microsoft_ad.html>`__ instance in the root account to facilitate integration with the on-premises Active Directory, enabling the on-premises AD to serve as the authoritative Identity source.

This ensures that all existing governance, policies, and processes for user onboarding at the center are applied to the cloud. Leveraging AWS Single Sign-On (SSO), on-premises identities are used to access accounts and services in AWS, thereby minimizing the need for IAM accounts.

Network Traffic/Firewall
__________________________

A requirement for the AD integration is a two-way trust between the AWS-managed AD and the on-premises Active Directory. This requires several Windows ports to be open between both environments, including ephemeral ports. This proved to be a challenge as many layers of firewalls exist between the environments, as well as the use of NAT. As discussed in :ref:`Dedicated Private IP Routing VLAN`, a workaround was to create a separate VLAN for private IP routing without NAT, which enabled the desired two-way trust.

Delegation
___________

To minimize the use of the root account, member accounts have been granted appropriate access to various services, including Security Hub, IAM Identity Center, Trusted Advisor, and Guard Duty. For more details, please refer to the `Delegated administrator for AWS Organizations. <https://docs.aws.amazon.com/organizations/latest/userguide/orgs_delegate_policies.html>`__

Single Sign-On (IAM Identity Center)
------------------------------------

The NCCoE enabled Single Sign On to manage user access to AWS accounts and applications from a single location. For more information on Single Sign-On, please refer to the `IAM Identity Center <https://aws.amazon.com/iam/identity-center/>`__.

Permission Sets Based on Roles
------------------------------

AWS Permission Sets are templates that define a collection of one or more IAM policies. These sets simplify the assignment of AWS account access for users and groups within an organization. The NCCoE follows the principle of least privilege in assigning permission sets. Specific policies are created to grant access as well as deny access. For more information on AWS permission sets, please refer to the `Manage AWS accounts with permission sets <https://docs.aws.amazon.com/singlesignon/latest/userguide/permissionsetsconcept.html>`__.

AWS IAM Accounts
----------------

While the on-premises Active Directory is the authoritative identity source, a few IAM accounts remain in the research cloud environment primarily as break-glass/emergency use only. IAM accounts require multifactor authentication (MFA), which is enforced via policy.

Multifactor Authentication
____________________________

MFA is enforced in both the IAM Identity Center and in IAM. For more information on the IAM Identity Center, please see `AWS IAM Identity Center <https://aws.amazon.com/iam/identity-center/>`__.

Service Control Policies
========================

Service Control Policies (SCPs) are policies used to manage permissions within an organization. The NCCoE leverages SCPs to ensure governance, security, and structure. For more information on SCPs, please see `Service Control Policies (SCPs) <https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html>`__.

Organization
------------

Tagging
_________

The NCCoE enforces tagging policies on several services, including VPCs, Elastic Compute Cloud (EC2), Security Groups, buckets, route tables… to ensure structure and facilitate the management/reporting of services in all accounts. For example, a select group of tags is required to create an EC2 instance, including the project name and environment (Test/Dev/Prod).

An `example tagging policy <https://github.com/usnistgov/ACMVPDocs/blob/main/Infrastructure/tagging_policy_example.json>`__ can be found in the ACMVP Documentation repository.

Access
________

The NCCoE restricts the AWS research environment to a specific region to ensure proximity to our user base, lower costs, improved monitoring, and simpler management.

An `example access policy <https://github.com/usnistgov/ACMVPDocs/blob/main/Infrastructure/allow_policy_example.json>`__ can be found in the ACMVP Documentation repository.

Marketplace Restrictions
^^^^^^^^^^^^^^^^^^^^^^^^^^

The NCCoE restricts access to third-party Marketplace services for specific accounts for cost control, standardization, security, and compliance policies. For example, the NCCoE leverages secure config Amazon Machine Images (AMI) that NIST generates and updates regularly. To ensure the secure config AMIs are the default choice, a secure config policy is implemented, removing third-party AMIs.

An `example marketplace policy <https://github.com/usnistgov/ACMVPDocs/blob/main/Infrastructure/ec2%2Bawsmarketplace_policy_example.json>`__ can be found in the ACMVP Documentation repository.

Backup (EC2, RDS, Lambda Function)
____________________________________

The NCCoE enforces a backup policy for EC2 instances and AWS Relational Database Services (RDS.) Lambda functions are leveraged to ensure a “backup=yes” tag exists on all EC2 and RDS instances. The backup policy ensures all EC2 and RDS instances with the “backup=yes” tag are backed up.

An `example Lambda function <https://github.com/usnistgov/ACMVPDocs/blob/main/Infrastructure/cloudFormation-S3-lambda-example.yml>`__ and `example backup policy <https://github.com/usnistgov/ACMVPDocs/blob/main/Infrastructure/backup_policy_example.json>`__ can be found in the ACMVP Documentation repository.

MFA
---

The NCCoE enforces MFA to access its AWS research cloud environment. Please refer to :ref:`Multifactor Authentication` for IAM Identity Center. For IAM, a policy was created to enforce MFA.

An `example IAM policy to enforce MFA <https://github.com/usnistgov/ACMVPDocs/blob/main/Infrastructure/iam_policy_example.json>`__ can be found in the ACMVP Documentation repository.

S3 Bucket
---------

The NCCoE enforces several bucket policies for security and compliance requirements, including enforcing SSO, Tagging, Lifecycle, and restricting public access. The NCCoE leverages AWS lambda functions to detect bucket creations and automatically apply the required policies.

A sample `CloudFormation template <https://github.com/usnistgov/ACMVPDocs/blob/main/Infrastructure/cloudFormation-S3-lambda-example.yml>`__ that creates a Lambda function that applies required policies (including lifecycle policies) can be found in the ACMVP Documentation repository. This repository also includes an example `public access restriction policy for S3 buckets <https://github.com/usnistgov/ACMVPDocs/blob/main/Infrastructure/S3_policy_example.json>`__.

Security Groups
---------------

The NCCoE discourages the creation of open security groups that allow any source to any destination (Quad Zeros). An AWS lambda function has been created to detect and modify such security groups, restricting the source traffic to the NCCoE network only.

Deny S3 Public Access
---------------------

The NCCoE prevents the configuration of a publicly accessible S3 bucket.

An example `public access restriction policy for S3 buckets <https://github.com/usnistgov/ACMVPDocs/blob/main/Infrastructure/S3_policy_example.json>`__ can be found on the ACMVP Documentation repository.

Deny EC2 and VPC Creation Without Tags
--------------------------------------

The NCCoE enforces the application of requested tags when creating new VPCs and EC2s, as mentioned in :ref:`Tagging`.

Deny Instances Larger than “Expected Size”
------------------------------------------

The NCCoE prevents the creation of instances larger than “standard” size in its labs to avoid excessive resource allocation and for budget control.

An `example policy <https://github.com/usnistgov/ACMVPDocs/blob/main/Infrastructure/ec2%2BIWGEgress_policy_example.json>`__ for denying the creation of EC2 instances larger than the policy limit can be found in the ACMVP Documentation repository.

Deny SSO-Identity Center
------------------------

The NCCoE prevents member accounts from launching Identity Center to ensure compliance with our security and governance processes.

An `example policy <https://github.com/usnistgov/ACMVPDocs/blob/main/Infrastructure/iam_policy_example.json>`__ for denying member accounts access to Identity Center can be found in the ACMVP Documentation repository.

Deny Internet Gateway (IGW) Egress
----------------------------------

All traffic in the NCCoE Research Cloud is hair-pinned back to NIST, forcing traffic to flow through specific route tables and firewalls. This ensures all traffic coming in and going out of the research cloud is fully monitored. A policy has been deployed to prevent member accounts from changing the approved route for all traffic by denying the creation of IGWs and VPC peering connections or the change of existing VPN endpoints and TGAs (Routing through the transit gateway/DirectConnect/Specific Firewalls).

An `example policy <https://github.com/usnistgov/ACMVPDocs/blob/main/Infrastructure/ec2%2BIWGEgress_policy_example.json>`__ for denying the creation IGWs can be found in the ACMVP Documentation repository.

Deny Quad Zeros (AWS System Manager Documents)
----------------------------------------------

The NCCoE utilizes `AWS Systems Manager Documents <https://docs.aws.amazon.com/systems-manager/latest/userguide/what-is-systems-manager.html>`__ to restrict the use of quad zeros (0.0.0.0) in security groups, ensuring adherence to security best practices. All security groups are audited for quad zeros on an established frequency. If any are identified, the quad zeros are replaced with a local network.

Additional details on the implementation can be found in :ref:`Deny Quad Zeros`.

Deny Non-secure Config AMIs
---------------------------

The NCCoE enforces a policy that only allows the selection of secure config Amazon Machine Images (AMI) available via a trust relationship established with the NIST organization. This enables the NCCoE to leverage secure config AMIs developed and maintained by NIST.

An `example policy <https://github.com/usnistgov/ACMVPDocs/blob/main/Infrastructure/ec2_deny_policy_example.json>`__ for denying the usage of unapproved AMIs can be found in the ACMVP Documentation repository.
