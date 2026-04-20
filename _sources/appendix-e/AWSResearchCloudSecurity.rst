AWS Research Cloud Security
===========================

AWS Control Tower
-----------------

The AWS research environment was deployed leveraging AWS `Control Tower <https://docs.aws.amazon.com/controltower/>`__ for orchestration. The recommended AWS guardrails were selected during the deployment process.

Preventative Controls
---------------------

The table below lists enabled preventative controls:

.. table:: Table 1: Preventative controls

   +------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
   | Amazon CloudWatch                        | [AWS-GR_LOG_GROUP_POLICY] Disallow changes to Amazon CloudWatch Logs log groups set up by AWS Control Tower                                      |
   +------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
   | Amazon EC2                               | [AWS-GR_EC2_INSTANCE_NO_PUBLIC_IP] Detect whether any Amazon EC2 instance has an associated public IPv4 address                                  |
   +------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
   | Amazon EventBridge                       | [AWS-GR_CLOUDWATCH_EVENTS_CHANGE_PROHIBITED] Disallow changes to Amazon CloudWatch set up by AWS Control Tower                                   |
   +------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
   | Amazon S3                                | [AWS-GR_S3_ACCOUNT_LEVEL_PUBLIC_ACCESS_BLOCKS_PERIODIC] Detect whether Amazon S3 settings to block public access are set as true for the account |
   +------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
   | Amazon S3                                | [SH.S3.1] S3 Block Public Access setting should be enabled                                                                                       |
   +------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
   | Amazon S3                                | [AWS-GR_RESTRICT_S3_DELETE_WITHOUT_MFA] Disallow delete actions on S3 buckets without MFA                                                        |
   +------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
   | Amazon SNS                               | [AWS-GR_SNS_CHANGE_PROHIBITED] Disallow changes to Amazon SNS set up by AWS Control Tower                                                        |
   +------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
   | Amazon SNS                               | [AWS-GR_SNS_SUBSCRIPTION_CHANGE_PROHIBITED] Disallow changes to Amazon SNS subscriptions set up by AWS Control Tower                             |
   +------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
   | AWS CloudTrail                           | [AWS-GR_CLOUDTRAIL_CHANGE_PROHIBITED] Disallow configuration changes to CloudTrail                                                               |
   +------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
   | AWS CloudTrail                           | [AWS-GR_CLOUDTRAIL_CLOUDWATCH_LOGS_ENABLED] Integrate CloudTrail events with CloudWatch Logs                                                     |
   +------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
   | AWS CloudTrail                           | [AWS-GR_CLOUDTRAIL_ENABLED] Enable CloudTrail in all available regions                                                                           |
   +------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
   | AWS CloudTrail                           | [AWS-GR_CLOUDTRAIL_VALIDATION_ENABLED] Enable integrity validation for CloudTrail log file                                                       |
   +------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
   | AWS Config                               | [AWS-GR_CONFIG_AGGREGATION_AUTHORIZATION_POLICY] Disallow deletion of AWS Config Aggregation Authorizations created by AWS Control Tower         |
   +------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
   | AWS Config                               | [AWS-GR_CONFIG_AGGREGATION_CHANGE_PROHIBITED] Disallow changes to tags created by AWS Control Tower for AWS Config resources                     |
   +------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
   | AWS Config                               | [AWS-GR_CONFIG_CHANGE_PROHIBITED] Disallow configuration changes to AWS Config                                                                   |
   +------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
   | AWS Config                               | [AWS-GR_CONFIG_ENABLED] Enable AWS Config in all available regions                                                                               |
   +------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
   | AWS Config                               | [AWS-GR_CONFIG_RULE_CHANGE_PROHIBITED] Disallow changes to AWS Config Rules set up by AWS Control Tower                                          |
   +------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
   | AWS Identity and Access Management (IAM) | [AWS-GR_IAM_ROLE_CHANGE_PROHIBITED] Disallow changes to AWS IAM roles set up by AWS Control Tower and AWS CloudFormation                         |
   +------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
   | AWS Lambda                               | [AWS-GR_LAMBDA_CHANGE_PROHIBITED] Disallow changes to AWS Lambda functions set up by AWS Control Tower                                           |
   +------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
   | Multiple                                 | [AWS-GR_REGION_DENY] Deny access to AWS based on the requested AWS Region                                                                        |
   +------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
                                                                                                                                                                                                    
.. table:: Table 2: Additional Preventative Controls for Security Audit and Logs:                                                                                                                                      
                                                                                                                                                                                                    
   +-----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+     
   | Amazon S3 | [AWS-GR_AUDIT_BUCKET_PUBLIC_READ_PROHIBITED] Detect public read access setting for log archive                                                                                 |     
   +------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------+     
   | Amazon S3 | [AWS-GR_AUDIT_BUCKET_PUBLIC_WRITE_PROHIBITED] Detect public write access setting for log archive                                                                               |     
   +-----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+     
   | Amazon S3 | [AWS-GR_AUDIT_BUCKET_DELETION_PROHIBITED] Disallow deletion of log archive                                                                                                     |     
   +-----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+     
   | Amazon S3 | [AWS-GR_CT_AUDIT_BUCKET_ENCRYPTION_CHANGES_PROHIBITED] Disallow Changes to Encryption Configuration for AWS Control Tower Created S3 Buckets in Log Archive                    |     
   +-----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+     
   | Amazon S3 | [AWS-GR_CT_AUDIT_BUCKET_LIFECYCLE_CONFIGURATION_CHANGES_PROHIBITED] Disallow changes to lifecycle configuration for AWS Control Tower created Amazon S3 buckets in log archive |     
   +-----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+     
   | Amazon S3 | [AWS-GR_CT_AUDIT_BUCKET_LOGGING_CONFIGURATION_CHANGES_PROHIBITED] Disallow changes to logging configuration for AWS Control Tower created Amazon S3 buckets in log archive     |     
   +-----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+     
   | Amazon S3 | [AWS-GR_CT_AUDIT_BUCKET_POLICY_CHANGES_PROHIBITED] Disallow changes to bucket policy for AWS Control Tower created Amazon S3 buckets in log archive                            |     
   +-----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+     

Detective Controls
------------------

The table below lists enabled detective controls:

.. table:: Table 3 Detective controls

   +------------+--------------------------------------------------------------------------------------------------------------------------------------------------+                         
   | Amazon EC2 | [AWS-GR_EC2_INSTANCE_NO_PUBLIC_IP] Detect whether any Amazon EC2 instance has an associated public IPv4 address                                  |                         
   +------------+--------------------------------------------------------------------------------------------------------------------------------------------------+                         
   | Amazon S3  | [AWS-GR_S3_ACCOUNT_LEVEL_PUBLIC_ACCESS_BLOCKS_PERIODIC] Detect whether Amazon S3 settings to block public access are set as true for the account |                         
   +------------+--------------------------------------------------------------------------------------------------------------------------------------------------+                         
   | Amazon S3  | [SH.S3.1] S3 Block Public Access setting should be enabled                                                                                       |                         
   +------------+--------------------------------------------------------------------------------------------------------------------------------------------------+                         
                                                                                                                                                                                             
.. table:: Table 4 Additional Detective Controls For Security Audit and Logs:                                                                                                                                   
                                                                                                                                                                                             
   +----------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Amazon S3      | [AWS-GR_AUDIT_BUCKET_PUBLIC_READ_PROHIBITED] Detect public read access setting for log archive                                                                           |
   +----------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Amazon S3      | [AWS-GR_AUDIT_BUCKET_PUBLIC_WRITE_PROHIBITED] Detect public write access setting for log archive                                                                         |
   +----------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | AWS CloudTrail | [AWS-GR_DETECT_CLOUDTRAIL_ENABLED_ON_SHARED_ACCOUNTS] Detect whether a shared account in the Security organizational unit has AWS CloudTrail or CloudTrail Lake enabled. |
   +----------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------+


Landing Zone Settings (Blocking of Regions, Enabling AWS CloudTrail and IAM Identity Center)
--------------------------------------------------------------------------------------------

A `landing zone <https://docs.aws.amazon.com/prescriptive-guidance/latest/migration-aws-environment/understanding-landing-zones.html>`__ is a well-architected, multi-account AWS environment that is scalable and secure. The NCCoE's landing zone was deployed using `AWS Control Tower <https://docs.aws.amazon.com/controltower/>`__. The NCCoE has the following settings enabled in its landing zone:

- AWS CloudTrail

- AWS IAM Identity Center

- Region Deny control

- Landing zone regions

- Log Configuration

AWS Config
----------

`AWS Config <https://docs.aws.amazon.com/config/latest/developerguide/WhatIsConfig.html>`__ provides a detailed view of the configuration of AWS resources in your AWS account. The NCCoE uses AWS Config to ensure compliance with our controls and policies. Used in conjunction with AWS Control Tower, AWS Config detects and can remediate configurations and changes in accordance with established policies. For example, when a new Member Account is deployed, AWS Config creates an S3 logging bucket for that member account. A remediation action ensures that any future buckets created within that member account are configured to send their logs to this logging bucket.

IAM Identity Center 
--------------------

`AWS IAM Identity Center <https://aws.amazon.com/iam/identity-center/>`__ is a service that helps centrally manage access to multiple AWS accounts and business applications using federated user identities. The NCCoE has federated with its on-premises authoritative Identity source, which is an instance of Microsoft Active Directory.

AWS CloudTrail
--------------

`AWS CloudTrail <https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html>`__ is an AWS service that helps enable operational and risk auditing, governance, and compliance of AWS accounts. The NCCoE uses AWS CloudTrail primarily for monitoring, dashboard reporting, and alerting. The NCCoE has the following three CloudTrails:

- A CloudTrail connected with AWS Control Tower

- A CloudTrail for tracking management-related events

- A CloudTrail for tracking compliance, archived in the Log Archive Account through an AWS Security Lake

AWS CloudWatch (Used in Conjunction With SNS topics)
----------------------------------------------------

`Amazon CloudWatch <https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html>`__ monitors Amazon Web Services (AWS) resources and the applications running on AWS in real-time, offering many tools for system-wide observability of application performance, operational health, and resource utilization. The NCCoE leverages information collected via CloudWatch to generate dashboards for a holistic view and insight into our cloud environment.

Monitoring and Alerts Throughout the Environment 
-------------------------------------------------

The NCCoE uses Amazon CloudWatch to monitor and create alarms on specific events throughout the environment. The NCCoE has created dashboards and alarms to help with reporting visualization and ensure operational excellence.

SNS Topics
----------

An Amazon `Simple Notification Service <https://docs.aws.amazon.com/sns/latest/dg/sns-create-topic.html>`__ topic serves as a logical access point, acting as a communication channel. The NCCoE has created many SNS topics for notification on various events. Below is a list of SNS topics in the NCCoE member accounts:

- Failed logins

- AWS config changes

- IAM VPC creation

- Root member account sign-ins

- KMS Key deletion

- S3 objects deletion

- Billing limit threshold

- Creation/Deletion of member account

- IAM Root console sign in

- Backup failures

- AWS administrator logins

- Direct Connect Link connectivity outage

- Restore of EC2 instance

Break Glass Accounts
--------------------

The NCCoE uses its on-premises Active Directory for authentication via SSO to its AWS research cloud. However, a handful of IAM accounts exist and are maintained for emergency (break glass) access.

Amazon EventBridge
------------------

`Amazon EventBridge <https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-what-is.html>`__ is a serverless service that uses events to connect application components, making it easier to build scalable, event-driven applications. The NCCoE leverages Amazon EventBridge rules/schedules to monitor API activities and trigger an Amazon SNS topic or an AWS Lambda function. The SNS Topics listed in :ref:`SNS Topics` above are rule examples triggered by AWS EventBridge.

Amazon GuardDuty 
-----------------

`Amazon GuardDuty <https://docs.aws.amazon.com/guardduty/latest/ug/what-is-guardduty.html>`__ is a threat detection service that monitors, analyzes, and processes AWS data sources and logs. The NCCoE leverages central management of Amazon GuardDuty via delegation across all accounts in the environment. The NCCoE currently has eight GuardDuty protection plans enabled, including:

- S3 Protection

- EKS Protection

- Extended Threat Detection

- Runtime Monitoring

- Malware Protection for EC2

- Malware Protection for S3

- RDS Protection

- Lambda Protection

AWS Simple Systems Manager
--------------------------

`AWS Systems Manager <https://docs.aws.amazon.com/systems-manager/latest/userguide/what-is-systems-manager.html>`__ (SSM) enables a centralized view, operation, and management in AWS and multi-cloud environments. The NCCoE leverages AWS SSM in a few ways:

- Access to EC2 consoles without opening additional firewall ports

- Patching of EC2 instances

- Remediation of configuration drifts

- Systems inventory reports

AWS IAM Policies 
-----------------

The NCCoE uses `AWS IAM policies <https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html>`__ to grant access to resources in accordance with security best practices.

AWS Key Management Service (KMS) 
---------------------------------

`AWS KMS <https://docs.aws.amazon.com/kms/latest/developerguide/overview.html>`__ simplifies the creation and management of encryption keys in the AWS environment. The NCCoE leverages AWS KMS throughout the environment, including the encryption of S3 buckets and SNS topics. This is accomplished through a specialized configuration within the AWS KMS service. Access keys for specific accounts are also rotated every 90 days via an AWS KMS integration with a custom AWS Lambda function. For an example of this rotation process, see :ref:`Automated Rotation of Console Access Keys`.

AWS Security Hub 
-----------------

`AWS Security Hub <https://docs.aws.amazon.com/securityhub/latest/userguide/what-is-securityhub.html>`__ provides a comprehensive view of the AWS security state. NCCoE baselines its AWS environment against the following three security standards:

- CIS AWS Foundations Benchmark v3.0.0

- NIST Special Publication 800-53 Revision 5

- AWS Foundational Security Best Practices v1.0.0

AWS Trusted Advisor Reports 
----------------------------

`AWS Trusted Advisor <https://docs.aws.amazon.com/awssupport/latest/user/trusted-advisor.html>`__ continuously inspects the environment and provides recommendations based on security best practices, cost-saving optimization, and performance improvements. NCCoE reviews AWS Trusted Advisor recommendations regularly to ensure operational excellence.

AWS Security Hub Compliance Analyzer (SHCA)
-------------------------------------------

`AWS Security Hub Compliance Analyzer <https://github.com/awslabs/security-hub-compliance-analyzer/blob/main/README.md>`__ (SHCA) is an AWS lambda function available on `GitHub <https://github.com/awslabs/security-hub-compliance-analyzer>`__ that generates artifacts in support of the Department of Defense Risk Management Framework (RMF) Information System accreditation. This helps to assess how well the AWS environment aligns with security best practices, frameworks, or regulatory requirements. The NCCoE reviews SHCA reports regularly to ensure operational excellence.

Prowler
-------

Prowler (often referred to as AWS Prowler) is an open-source security tool available on `GitHub <https://github.com/prowler-cloud/prowler>`__ designed to perform security assessments, audit checks, and compliance evaluations of the AWS environment. The NCCoE reviews Prowler reports regularly to ensure operational excellence.

Amazon Security Lake
--------------------

`Amazon Security Lake <https://aws.amazon.com/security-lake/>`__ centralizes all AWS logs (Security, CloudTrail, VPC flow, etc.) into an S3 bucket and supports multiple accounts and regions. Such logs can be queried as needed via AWS Athena. NCCoE has consolidated and centralized all AWS logs in an AWS Security Lake in the Log-Archives account. Security Engineers can query the logs for specific events as needed across the entire organization. This Security Lake has proved to be valuable for incident response and investigative purposes.

Security Compliance
-------------------

The NCCoE leverages numerous tools covered earlier in this section to monitor, detect, correct, report, and manage security compliance of the environment. The NCCoE also holds monthly Cloud Center of Excellence and bi-annual Governance Cloud environment reviews.

