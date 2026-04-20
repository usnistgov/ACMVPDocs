Overview
=========

This publication summarizes key challenges faced by the Cryptographic Module Validation Program (CMVP) and presents an approach to demonstrate automation of the manual processes. It highlights the workstreams' development of protocols and structured data to streamline the processes and increase efficiency.

Challenge
----------

The CMVP validates third-party assertions that cryptographic module implementations satisfy the requirements of Federal Information Processing Standards (FIPS) Publication 140-3, Security Requirements for Cryptographic Modules :ref:`[1] <ref-1>`. Under the CMVP, cryptographic modules undergo third-party testing by National Voluntary Laboratory Accreditation Program (NVLAP) accredited laboratories, and the processes and results are validated under a program run by the National Institute of Standards and Technology (NIST) and the Canadian Centre for Cyber Security (CCCS). Current industry cryptographic product development, production, and maintenance processes place significant emphasis on time-to-market efficiency. A number of elements of the validation process are manual in nature, and the period required for third-party testing and government validation of cryptographic modules is often incompatible with industry development and release cycles. Given the increasing velocity of product and software updates, as well as the migration towards post-quantum cryptography (PQC), there is a significant risk of continued backlog in validation without a shift toward automation. 

Solution
---------

The NIST National Cybersecurity Center of Excellence (NCCoE), in collaboration with the CMVP, has undertaken a project to demonstrate the value and practicality of automation support to improve the responsiveness of CMVP. The intent of the Automated Cryptographic Module Validation Project (ACMVP) is to support improvement in the efficiency and timeliness of CMVP :ref:`[2] <ref-2>` operations and processes. This NCCoE effort builds on other automation initiatives within the CMVP ecosystem, such as the successful completion of the automation of the Cryptographic Algorithm Validation Program (CAVP); the rollout of WebCryptik, an application for submitting test results to the CMVP; and the automation of entropy data testing evidence processing for the Entropy Source Validation (ESV) program. The initiative will provide mechanisms for the structural presentation of testing evidence by NVLAP-accredited parties to facilitate the automation of evidence validation by the CMVP. 

The ACMVP's goal is to enable automated test report review where feasible for each of the test requirements found in FIPS 140-3 :ref:`[2] <ref-2>` and International Organization for Standardization (ISO)/International Electrotechnical Commission (IEC) 24759 :ref:`[3] <ref-3>`, which FIPS 140-3 incorporates by reference.

The module testing and reporting aspects of module validation, according to ISO/IEC 24759, combine functional and nonfunctional security requirements. This project aims to streamline the test methods for the functional testing of specific classes of technologies (e.g., software modules) and the corresponding reporting of functional and non-functional security requirements. The project is working to demonstrate a suite of tools to modernize and automate manual review processes. 

The project was executed across three workstreams in collaboration with accredited test laboratories, vendors, and participating authorities. The Test Evidence (TE) Workstream focused on how individual requirements (as defined in ISO/IEC 24759 as Test Evidences) are classified by the lab and the validation authority. The Protocol Workstream has demonstrated a server and client implementation to accept and process module validation submissions. The Research Infrastructure Workstream developed the laboratory environment in which the server resides. The combined impact of these workstreams is resulting in automation improvements to the operations of the CMVP.

How to Use This Guide
----------------------

This guide offers two content formats: the "High-Level Document in PDF Format" and implementation details on the ACMVP Documentation website (this site). The PDF document serves as an introduction to the project, including a high-level summary of the project goals, ACMVP capabilities, demonstrated implementations, and project findings. The linked web pages provide in-depth details on NIST SP 1800-40: Automation of the NIST Cryptographic Module Validation Program, including full TE classification lists, protocol descriptions implemented by the server and clients, and the technologies leveraged, with specific integrations and configurations. Readers are encouraged to begin by reading the document in PDF format to gain high-level insight into the project. Readers may then drill down from this document into the deeper sections of the linked web pages to access in-depth information as needed. 

Therefore, this document is organized as follows:

* :ref:`Approach` describes the approach taken to demonstrate the use of automation tools by the CMVP.
* :ref:`Test Evidence Workstream` describes the work of, and capabilities demonstrated by, the Test Evidence Workstream.
* :ref:`Protocol Workstream` describes the protocol and implementations demonstrated by the Protocol Workstream.
* :ref:`Research Infrastructure` describes the laboratory development and demonstration environment developed by the Research Infrastructure Workstream.
* :ref:`Findings and Recommendations for Future Work` concludes this document by sharing takeaways as recommended steps for continuing automation of CMVP processes.

Anyone interested primarily in the lessons learned from the project should focus on the takeaways provided in the :ref:`Findings and Recommendations for Future Work`. 
