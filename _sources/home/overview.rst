Overview
=============

This publication summarizes key challenges faced by the Cryptographic Module Validation Program (CMVP) and presents an approach to demonstrate automation of the manual processes. It highlights the workstreams' development of protocols and structured data to streamline the processes and increase efficiency.

Challenge
____________

The CMVP validates third-party assertions that cryptographic module implementations satisfy the requirements of Federal Information Processing Standards (FIPS) Publication 140-3, Security Requirements for Cryptographic Modules :ref:`[1] <ref-1>`. Under the CMVP, cryptographic modules undergo third-party testing by National Voluntary Laboratory Accreditation Program (NVLAP) accredited laboratories, and the processes and results are validated under a program run by the National Institute of Standards and Technology (NIST) and the Canadian Centre for Cyber Security (CCCS). Current industry cryptographic product development, production, and maintenance processes place significant emphasis on time-to-market efficiency. A number of elements of the validation process are manual in nature, and the validation timelines are often incompatible with industry development and release cycles. Given the increasing velocity of product and software updates, as well as the migration towards post-quantum cryptography (PQC), there is a significant risk of continued backlog in validation without a shift toward automation. 

Solution
____________

The NIST National Cybersecurity Center of Excellence (NCCoE), in collaboration with the CMVP, has undertaken a project to demonstrate the value and practicality of automation support to improve the responsiveness of CMVP. The intent of the Automated Cryptographic Module Validation Project (ACMVP) is to support improvement in the efficiency and timeliness of CMVP :ref:`[2] <ref-2>` operations and processes. This NCCoE effort builds on other automation initiatives within the CMVP ecosystem, such as the successful completion of the automation of the Cryptographic Algorithm Validation Program (CAVP); the rollout of WebCryptik, an application for submitting test results to the CMVP; and the automation of entropy data testing evidence processing for the Entropy Source Validation Test System (ESVTS). The initiative will provide mechanisms for the structural presentation of testing evidence by NVLAP-accredited parties to facilitate the automation of evidence validation by the CMVP. 

The ACMVP's goal is to enable automated reviewing of test reports where feasible for each of the test requirements found in FIPS 140-3 :ref:`[2] <ref-2>` and International Organization for Standardization (ISO)/International Electrotechnical Commission (IEC) 24759 :ref:`[3] <ref-3>`, which FIPS 140-3 incorporates by reference.

The module testing and reporting aspects of module validation, according to ISO/IEC 24759, combine functional and non-functional security requirements. This project aims to streamline the test methods for the functional testing of specific classes of technologies (e.g., software modules) and the corresponding reporting of functional and non-functional security requirements. The project is working to demonstrate a suite of tools to modernize and automate manual review processes. 
