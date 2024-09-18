Overview
=========

Challenge
----------

The Cryptographic Module Validation Program (CMVP) validates third-party assertions that cryptographic module implementations satisfy the requirements of Federal Information Processing Standards (FIPS) Publication 140-3, Security Requirements for Cryptographic Modules. Under the CMVP, cryptographic modules undergo third-party testing by National Voluntary Laboratory Accreditation Program (NVLAP) accredited laboratories, and the processes and results are validated under a program run by the National Institute of Standards and Technology (NIST) and the Canadian Center for Cyber Security (CCCS). Current industry cryptographic product development, production, and maintenance processes place significant emphasis on time-to-market efficiency. A number of elements of the validation process are manual in nature, and the period required for third-party testing and government validation of cryptographic modules is often incompatible with industry requirements.

Solution
---------

The NIST National Cybersecurity Center of Excellence (NCCoE) has undertaken a project to demonstrate the value and practicality of automation support to improve the responsiveness of CMVP. The intent of the Automated Cryptographic Module Validation Project (ACMVP) is to support improvement in the efficiency and timeliness of CMVP operations and processes. This NCCoE effort is one of a number of activities focused on the automation of module validation and report review flow, and it follows the successful completion of NIST efforts such as the automation of the Cryptographic Algorithm Validation Program (CAVP); the rollout of Web CRYPTIK, an application for submitting test results to the CMVP; and the automation of the processing of entropy data testing evidence for the Entropy Source Validation (ESV) program. The initiative aims to provide mechanisms for structural presentation of testing evidence by NVLAP-accredited parties to facilitate the automation of evidence validation by the CMVP. 

The ACMVP's goal is to enable automated test report review where feasible for each of the test requirements found in FIPS 140-3 and International Organization for Standardization (ISO)/International Electrotechnical Commission (IEC) 24759, which FIPS 140-3 incorporates by reference. Because of the wide range of the technologies and corresponding security requirements that the CMVP covers, this effort is being executed in phases. The initial phase of software module validation such as an OpenSSL module is foundational and will determine future phases.

The module testing and reporting aspects of module validation, according to ISO/IEC 24759, combine functional and nonfunctional security requirements. This project attempts to streamline the test methods for the functional tests of specific classes of technologies (e.g., software modules) and corresponding reporting of functional and non-functional security requirements. We are working to demonstrate a suite of tools to modernize and automate manual review processes in support of existing policy and efforts to include technical testing under the CMVP. These automated tools employ an NVLAP-accredited testing concept that permits organizations to perform the testing of their cryptographic products according to the requirements of FIPS 140-3, then directly report the results to NIST using appropriate protocols. 

The accredited parties will have to identify the corresponding personnel and organizational structures needed to perform this testing while complying with the laboratory requirements for testing programs established by NVLAP under NIST Handbook (HB) 150-17. The accreditation requirements in HB 150-17 are both hierarchical and compositional in nature so that organizations can tailor the scope of accreditation according to their specific product/service portfolio.

Progress To Date
------------------

To date, the ACMVP project has:

#. Identified and classified categories of test evidence required for CMVP validation that can readily be automated in a reporting format that is consistent with current  Web CRYPTIK and CMVP; identified the test evidence classes for which manual processes are still needed

#. Identified necessary schemas and protocols for evidence submission and validation for a scalable application programming interface (API) based architecture

#. Designed and developed a cloud native infrastructure required to support validation program automation 

In the initial phase, the project is divided into three workstreams: the :ref:`Test Evidence (TE) Workstream<Test Evidence Workstream>`, the :ref:`Protocol Workstream`, and the :ref:`Research Infrastructure Workstream`. Each is a focused effort in its own right. The combined impact of these workstreams will result in improvements to the overall automation of the CMVP.

Contributors to each workstream are listed in the corresponding sections below. Additionally, the following people and organizations contributed to the project outside of a workstream: Rochelle Casey, Alicia Squires, Margaret Salter, Tim Ness, and David Browning of Amazon; Apostol Vassilev, Dave Hawes, Gavin O'Brien, Tim Hall, Matt Scholl, Cheri Pascoe, Kevin Stine, Ann Rickerds, Jim Simmons, Rob Densock, and Blair Heiserman of NIST; William Barker of Dakota Consulting; Karen Scarfone of Scarfone Cybersecurity; and Heather Flanagan of Spherical Cow Consulting.
