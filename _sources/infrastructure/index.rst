Research Infrastructure Workstream
==================================

The ACMVP Research Infrastructure Workstream is led by Raoul Gabiam of The MITRE Corporation and Doug Boldt of Amazon, with contributions from Courtney Maatta, Annie Cimack, Diana Brooks, Charlotte Fondren, Zhuo-Wei Lee, Keonna Parrish, Abhishek Isireddy, Abi Adenuga, Bradley Wyman, Brittany Robinson, Gina McFarland, Damian Zell, Cavan Slaughter, Rayette Toles-Abdullah, and Natti Swaminathan of Amazon; Robert Staples and Murugiah Souppaya of NIST; Michael Dimond, Kyle Vitale, and Josh Klosterman of the MITRE Corporation; and John Booton, Aaron Cook, and Jeffrey LaClair of ITC Federal.

The Workstream's objective is to develop and demonstrate a cloud-native infrastructure that is scalable, efficient, and up to date (supports containers, zero trust principles, etc.).

This infrastructure is an extension of the on-premises private cloud at the NCCoE. The NCCoE on-premises infrastructure consists of a VMware private cloud and a Microsoft Active Directory which serves as the authoritative identity source for the supporting AWS research environment. The on-premises VMware private cloud is connected to the AWS supporting research environment via an AWS Direct Connect through NOAA/N-Wave. The supporting AWS research environment consists of multiple accounts following AWS and Special Publication 800-53 best practices to ensure isolation and segregation of administrative functions and security in each independent research lab.

A summary of steps taken to modernize the research infrastructure include:

-  **Leveraging cloud native technologies and services** - The current production CMVP environment was designed and built on a standard architecture for on-premises services. The project team is taking this opportunity to refactor the CMVP infrastructure to leverage cloud-native technologies and services. This will modernize the supporting infrastructure, improve efficiency and scalability, and streamline operations. Technologies and services being piloted include containerization to facilitate portability and scalability, serverless to improve efficiency, and AWS RDS and AWS CodeBuild to streamline and automate operations.

-  **Providing visibility in workloads and resources** - A benefit of leveraging cloud services is the transparency and visibility of workloads and their resources down to the specific services used. This enables the team test and balance efficiencies of cloud-native architectures while remaining cost conscious.

-  **Leveraging AWS cloud-native services for security** - The NCCoE AWS research cloud environment supporting the CMVP Automation project leverages AWS cloud-native technologies and services to secure the environment and ensure best practices are followed. These services include AWS Control Tower, AWS Organization, AWS Security Lake, AWS CloudWatch, AWS CloudTrail, AWS Security Hub, and more. A few mapping documents are being generated to capture how the NCCoE is following NIST best practice documents such as Special Publication 800-92 and 800-53 in their AWS research cloud environment.

-  **Infrastructure as code** - Another benefit of leveraging cloud-native services and tools is the ease of deploying them as code. This facilitates the creation of infrastructure stacks, which facilitates creation and replication of infrastructure from code

Next steps planned for the Research Infrastructure WS include:

-  Conducting a security assessment of the underlying infrastructure.

-  Deploying, testing, optimizing, and documenting a scalable and modernized CMVP infrastructure

-  Replicating the research environment into the NIST staging environment, and updating infrastructure documentation.