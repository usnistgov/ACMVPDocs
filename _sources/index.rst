Automation of the NIST Cryptographic Module Validation Program
============================================================================================================================

**April 2025 Status Report**

April 8, 2025

Abstract
---------

The Cryptographic Module Validation Program (CMVP) validates third-party assertions that cryptographic module implementations satisfy the requirements of Federal Information Processing Standards (FIPS) Publication 140-3, Security Requirements for Cryptographic Modules. The NIST National Cybersecurity Center of Excellence (NCCoE) has undertaken the Automated Cryptographic Module Validation Project (ACMVP) to support improvement in the efficiency and timeliness of CMVP operations and processes. The goal is to demonstrate a suite of automated tools that would permit organizations to perform testing of their cryptographic products according to the requirements of FIPS 140-3, then directly report the results to NIST using appropriate protocols.

This is the second status report for the project, which describes progress made since September 2024 with the ACMVP and the planned next steps for the project. The project is divided into three workstreams: the :ref:`Test Evidence (TE) Workstream <Test Evidence Workstream>` :ref:`Protocol Workstream <Protocol Workstream>`, and the :ref:`Research Infrastructure Workstream <Research Infrastructure Workstream>`. Each is a focused effort in its own right. The combined impact of these workstreams will result in improvements to the overall automation of the CMVP.

An overview of the project, its goals, and prior update of work accomplished are found in the `September 2024 status report <https://nvlpubs.nist.gov/nistpubs/CSWP/NIST.CSWP.37.ipd.pdf>`__. 

Audience
----------

The primary audience for this report is technology, security, and privacy program managers and architects, software developers, engineers, and IT professionals, especially those involved with the CMVP, accredited cryptography and security testing labs, and conformance offices at companies that produce security software and hardware.

Collaborators and Acknowledgments
----------------------------------

Collaborators participating in this project submitted their capabilities in response to an open call in the Federal Register for all sources of relevant security capabilities from academia and industry (vendors and integrators). The following respondents with relevant capabilities or product components signed a Cooperative Research and Development Agreement (CRADA) to collaborate with NIST in a consortium to build this example solution.

-  Acumen Security

-  AEGISOLVE

-  Apple

-  atsec

-  AWS

-  Cisco

-  Katalyst

-  Lightship Security

-  Microsoft

-  NXP Semiconductors

-  SUSE

Contributors to each workstream are listed in the corresponding sections below. Additionally, the following people and organizations contributed to the project outside of a workstream: Courtney Maatta, Rochelle Casey, Alicia Squires, Margaret Salter, Tim Ness, Damian Zell, Derrick Williams III, Jeff Wright, Mickey Iqbal, and David Browning of Amazon; Dave Hawes, Gavin O'Brien, Tim Hall, Matt Scholl, Cherilyn Pascoe, Jim St. Pierre, Kevin Stine, Ann Rickerds, Shawn Winhoven, Jeffrey J McIntyre, Anil Das, Edgar Garay, Jim Simmons, Rob Densock, and Blair Heiserman of NIST; William Barker of Strativia LLC; Karen Scarfone of Scarfone Cybersecurity; and Heather Flanagan of Spherical Cow Consulting.

The project team recognizes and appreciates Apostol Vassilev of NIST for leading the project at the inception and kicking off the project and formulating the three workstreams and associated activities.

Certain commercial entities, equipment, products, or materials may be identified by name or company logo or other insignia in order to acknowledge their participation in this collaboration or to describe an experimental procedure or concept adequately. Such identification is not intended to imply special status or relationship with NIST or recommendation or endorsement by NIST or NCCoE; neither is it intended to imply that the entities, equipment, products, or materials are necessarily the best available for the purpose.

**NIST Technical Series Policies**

`Copyright, Use, and Licensing Statements <https://doi.org/10.6028/NIST-TECHPUBS.CROSSMARK-POLICY>`__

**Public Comment Period**

April 8, 2025 - May 15, 2025

**Submit Comments**

applied-crypto-testing@nist.gov 

National Institute of Standards and Technology
Attn: Applied Cybersecurity Division, Information Technology Laboratory
100 Bureau Drive (Mail Stop 2000) Gaithersburg, MD 20899-2000

All comments are subject to release under the Freedom of Information Act (FOIA).

Updates since ICMC 2024
------------------------

Due to the shift in the ICMC schedule, only six months have passed between ICMC 2024 and ICMC 2025. The team accomplished the following across the three workstreams during that time:

Test Evidence Workstream 
__________________________

- Defined test methods for functional testing TEs to allow for more specific information and automation to be applied to the evidence collected.
- Improved the TE filtering coverage via thorough review of all sections of FIPS 140-3.

Protocol Workstream
__________________________

- Added automated rule processing on submissions with instant feedback. This is intended to catch inconsistencies and inaccuracies a CMVP reviewer would otherwise need to catch during their review of a submission. Feedback is provided instantly to the submitter and is required to be corrected before the submission is accepted.
- Added the source code evidence payloads to capture how source code TEs are evaluated by the lab.
- Flushed out the protocol to provide a more complete API for labs to interact with their submissions. 

Research Infrastructure Workstream
___________________________________

- Tools Researched:
   - Amazon RDS for SQL Server, AWS Database Migration Service (DMS), AWS CodeBuild, AWS CodePipeline, AWS CodeDeploy, Amazon ECS, Amazon EC2, ECS Fargate, EKS Auto Mode, Amazon Elastic Container Registry (ECR), Nginx Reverse Proxy, AWS Application Load Balancer (ALB), Amazon API Gateway, Microsoft Windows Containers, Linux Containers, GitHub, Amazon S3

- Outcomes:
   - Migrated legacy databases to a managed, scalable cloud platform.
   - Automated builds, testing, and deployments through a CI/CD pipeline.
   - Containerized core applications for faster deployments and improved maintainability.
   - Replaced legacy web servers with scalable, modern cloud-based routing and authentication.
   - Enabled secure, flexible authentication using mutual TLS and API keys.
   - Reduced deployment downtime and improved system resilience.
   - Streamlined developer workflows and accelerated update cycles.
   - Lowered operational complexity and infrastructure overhead.



.. toctree::
   :maxdepth: 3
   :titlesonly:
   :glob:
   :hidden:

   overview.rst
   te/index.rst
   protocol/index.rst
   infrastructure/index.rst
   conclusion.rst