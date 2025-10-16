Overview
=========

This section summarizes some of the challenges faced by the Cryptographic Module Validation Program (CMVP) and describes the efforts at the NCCoE to address those challenges. It highlights the status thus far across three workstreams' activities and associated achievements to streamline the processes to increase efficiency.

Challenge
----------

The CMVP validates third-party assertions that cryptographic module implementations satisfy the requirements of Federal Information Processing Standards (FIPS) Publication 140-3, Security160
Requirements for Cryptographic Modules. Under the CMVP, cryptographic modules undergo third-party testing by National Voluntary Laboratory Accreditation Program (NVLAP) accredited laboratories, and the processes and results are validated under a program run by the National Institute of Standards and Technology (NIST) and the Canadian Centre for Cyber Security (CCCS). Current industry cryptographic product development, production, and maintenance processes place significant emphasis on time-to-market efficiency. A number of elements of the validation process are manual in nature, and the period required for third-party testing and government validation of cryptographic modules is often incompatible with industry requirements.

Solution
---------

The NIST National Cybersecurity Center of Excellence (NCCoE) in collaboration with the CMVP has undertaken a project to demonstrate the value and practicality of automation support to improve the responsiveness of CMVP. The intent of the Automated Cryptographic Module Validation Project (ACMVP) is to support improvement in the efficiency and timeliness of CMVP operations and processes. This NCCoE effort is one of many focused on the automation of module validation and report review flow and follows the successful completion of NIST efforts such as the automation of the Cryptographic Algorithm Validation Program (CAVP); the rollout of Web CRYPTIK, an application for submitting test results to the CMVP; and the automation of entropy data testing evidence processing for the Entropy Source Validation (ESV) program. The initiative will provide mechanisms for structural presentation of testing evidence by NVLAP-accredited parties to facilitate the automation of evidence validation by the CMVP.

The ACMVP's goal is to enable automated test report review where feasible for each of the test requirements found in FIPS 140-3 and International Organization for Standardization (ISO)/International Electrotechnical Commission (IEC) 24759, which FIPS 140-3 incorporates by reference. Because of the wide range of the technologies and corresponding security requirements that the CMVP covers, this effort is being executed in phases. The initial phase of software module validation, such as an OpenSSL module, is foundational and will determine future phases.

The module testing and reporting aspects of module validation, according to ISO/IEC 24759, combine functional and nonfunctional security requirements. This project attempts to streamline the test methods for the functional tests of specific classes of technologies (e.g., software modules) and corresponding reporting of functional and non-functional security requirements. The team is working to demonstrate a suite of tools to modernize and automate manual review processes in support of existing policy and efforts to include technical testing under the CMVP, which employs an NVLAP-accredited testing concept that permits organizations to test their cryptographic products according to the FIPS 140-3 requirements and then directly report the results to NIST using appropriate protocols.

The accredited parties will have to identify the corresponding personnel and organizational structures needed to perform this testing while complying with the laboratory requirements for testing programs established by NVLAP under NIST Handbook (HB) 150-17. The accreditation requirements in HB 150-17 are both hierarchical and compositional in nature so that organizations can tailor the scope of accreditation according to their specific product/service portfolio.

The project is divided into three workstreams: the :ref:`Test Evidence (TE) Workstream<Test Evidence Workstream>`, the :ref:`Protocol Workstream`, and the :ref:`Research Infrastructure Workstream`. Each is a focused effort in its own right. The combined impact of these workstreams will result in improvements to the overall automation of the CMVP.

Progress To Date
------------------

This update covers progress in the project from September 2024 to April 2025. Due to the shift in the International Cryptographic Module Conference (ICMC) schedule, only six months passed between ICMC 2024 and ICMC 2025.

To date, the ACMVP project has:

#. Identified and classified categories of test evidence required for CMVP validation that can readily be automated in a reporting format that is consistent with current Web CRYPTIK and CMVP and identified the test evidence classes where manual processes are still needed;

#. Identified necessary schemas and protocols for evidence submission and validation for a scalable application programming interface (API) based architecture;

#. Designed and developed a cloud native infrastructure required to support validation program automation.

The ACMVP project team accomplished the following across the three workstreams:

**Test Evidence Workstream**

- Defined test methods for functional testing TEs to allow for more specific information and automation to be applied to the evidence collected
- Improved TE filtering coverage via thorough review of all sections of FIPS 140-3

**Protocol Workstream**

- Added an automated rule processing on submissions with instant feedback intended to catch inconsistencies and inaccuracies a CMVP reviewer would otherwise need to catch during their review of a submission and instantly provide feedback to the submitter, which needs to be corrected before the submission is accepted
- Added the source code evidence payloads to capture how source code TEs are evaluated by the lab
- Fleshed out the protocol to provide a more complete API for labs to interact with their submissions

**Research Infrastructure Workstream**

- **Tools Researched:**

 -   Amazon API Gateway, Amazon Elastic Container Registry (ECR), Amazon Relational Database Service (RDS) for Structured Query Language (SQL) Server, AWS Application Load Balancer (ALB), AWS Database Migration Service (DMS), AWS CodeBuild, AWS CodeDeploy, AWS CodePipeline, Amazon ECS, Amazon EC2, Elastic Container Service (ECS) Fargate, Elastic Kubernetes Service (EKS) Auto Mode, Amazon Simple Storage Service (S3), GitHub, Linux Containers, Microsoft Windows Containers, Nginx Reverse Proxy

- **Outcomes**

 -    Migrated legacy databases to a managed and scalable cloud platform
 -    Automated builds, testing, and deployments through a CI/CD pipeline
 -    Containerized core applications for faster deployments and improved maintainability
 -    Replaced legacy web servers with scalable, cloud-based routing and authentication
 -    Enabled secure, flexible authentication using mutual TLS and API keys 
 -    Reduced deployment downtime and improved system resilience 
 -    Streamlined developer workflows and accelerated update cycles 
 -    Lowered operational complexity and infrastructure overhead 
 -    Deployed a demo ACMVP server, enabling the community to explore and get acquainted with the newly developed application