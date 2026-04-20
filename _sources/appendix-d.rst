Appendix D: Application Modernization
======================================

The Infrastructure Workstream researched containerization approaches, Containers and EC2 launch types, Elastic Load Balancers, and Authentication layers that led to the final iteration. The services explored are summarized in this appendix.

Microsoft Windows Containers
------------------------------

Microsoft Windows containers were the starting point of the research since they run the same OS as the legacy ACMVP infrastructure. Additionally, they allow the use of Microsoft IIS in the container to handle the mTLS handshake for authentication. The applications were successfully containerized and enabled the modernization of the supporting infrastructure. However, there was a limitation with the AWS CodeBuild/CodePipeline integration, which requires Docker-in-Docker.

Linux Containers
--------------------

Linux containers do not support Microsoft IIS (where mTLS authentication is handled), which resulted in research for alternative authentication mechanisms. Microsoft-supported DotNet container images provide the necessary components to run the C# WebPublic application. nginx was selected as an open-source solution that provides mTLS configuration support and proxy capabilities.

Amazon EC2 Launch
--------------------

This container launch type utilizes a base Amazon Machine Image (AMI) to launch onto an Amazon EC2 instance. The container runs via a Docker daemon and is built locally. Network connections are routed through the Amazon EC2 instance to the underlying container.

Amazon EC2 Fargate Launch
--------------------------

The serverless Amazon ECS Fargate service provides a hosted platform for containerized tasks and services. Managed components consist of automation around host provisioning and compute monitoring. The end user is responsible for managing Amazon ECS tasks or service definitions that interface with the AWS-provided host through a mixture of AWS Identity and Access Management (IAM) controls, Amazon VPC security groups, and Elastic Network Interface (ENI) allocations.

Amazon ECS with Amazon EC2 Instance Launch
-------------------------------------------

The Amazon ECS with Amazon EC2 Instance launch type allows system administrators a more granular control of the underlying Amazon EC2 instance hosting the container. While identified as an option, Amazon EKS Auto Mode was prioritized to ensure alignment with NIST Security practices for production containerized applications.  

Amazon Fargate and Amazon EKS Launch
--------------------------------------

The Amazon EKS launch type was identified during this research. The team explored this option in earnest following ICMC ‘25. As with the Amazon ECS Fargate launch type, the foundational pieces controlling container workloads are managed and maintained by AWS.

As previously mentioned, the Amazon EKS service provides an AWS-managed solution for containerized workloads, which leverages the automated host and load balancer provisioning, auto-scaling integration, and workload access behind the scenes with a mixture of Amazon ALB, EC2, and VPC services. Cluster owners will manage how defined services and containerized workloads will interface with the underlying host through security groups and ENI mappings. Developers will manage application deployments and service connections via AWS ALB and RDS.

AWS Fargate provides an AWS-managed solution for launching containerized workloads as scalable services. Workloads are abstracted away from compute resources while providing connection points for containers via NCCoE-managed AWS VPC and subnets.

Layer 3 Authentication
------------------------

nginx Reverse Proxy
______________________

nginx is a reverse proxy that routes requests to the ACMVP server, similar to the use of Microsoft IIS in the WebPublic application. nginx supports mTLS authentication, allowing it to verify client certificates before forwarding requests. nginx in a Linux container maintains robust load balancing, security, and authentication capabilities similar to Microsoft IIS in a Windows container.

AWS Network Load Balancer (NLB)
__________________________________

An AWS Network Load Balancer (AWS NLB) was initially used to route traffic to the containerized application with Microsoft IIS. Experiments using AWS Application Load Balancer (ALB) were conducted to test handling both container/service-level routing and application-level authentication previously handled by Microsoft IIS.

The architecture changes finally settled on the implementation of AWS NLB to handle the passthrough of the mTLS handshake. Certificate authentication and management are still passed on to the application for authentication, authorization, and logging details as required.

Amazon API Gateway
____________________

Amazon API Gateway is an AWS service for creating, publishing, maintaining, monitoring, and securing REST, HTTP, and WebSocket APIs at any scale. This service allows for a one-to-one layer of connection between the gateway and the ACMVP web app endpoints and enables the development team to provision, distribute, and revoke API keys as an alternative and modern form of authentication for each API request made to the server. In combination with other services like AWS Cognito, labs could manage their own credentials to further improve operational efficiency.
