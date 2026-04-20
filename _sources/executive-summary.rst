Executive Summary
==================

The National Institute of Standards and Technology (NIST) and the Canadian Centre for Cyber Security (CCCS) jointly conduct the Cryptographic Module Validation Program (CMVP) to verify that cryptographic module implementations conform to the Federal Information Processing Standard (FIPS) 140-3. Federal agencies, many private sector companies, and foreign government organizations require cryptographic products to be CMVP-validated prior to being purchased and used. Since the CMVP's inception in 1995, the volume, complexity, and speed-to-market of cryptographic modules seeking validation have steadily increased. In the case of cryptographic software modules, product cycles now move in weeks or months. In recent years the testing and validation process could take up to 2 years to complete due to a combination of limited staff resources, incomplete submissions, and documentation ambiguities that extend the validation timeline. These delays limit product options for organizations required to use validated cryptography. 

NIST is undertaking a broad effort to modernize and automate CMVP processes with the goal to reduce dependence on manual review and timeliness and scalability of the validation process. This guide presents the approach developed by the National Cybersecurity Center of Excellence (NCCoE) and its collaborators to demonstrate automation capabilities that support the modernization of CMVP, helping align cryptographic validation processes with modern software development and deployment environments. 

The NCCoE Automated Cryptographic Module Validation Project (ACMVP) explored how structured test evidence, standardized submission protocols, and modern technology infrastructure across three coordinated workstreams enable automation of the validation processes: 

1.	Test evidence workstream: developed structured representation of FIPS 140-3 test evidence in order to enable machine-readable submissions. This was foundational in the creation of TE filters; listing required TEs based on the type of module being validated, reducing ambiguities and ensuring completeness and accuracy of each submission prior to CMVP review. 

2.	Protocol workstream: developed standardized submission interfaces to support automated checks prior to CMVP review. The developed schemas, protocol, and application reduce delays due to incompleteness and ambiguities in submissions by providing an interface that offers instant feedback prior to formal review by the CMVP. This ensures module submissions meet all requirements and follow a standardized format removing ambiguities. The standardized format also enables future work from the CMVP to automate the review of evidence. 

3.	Research infrastructure workstream: The CMVP develops and hosts applications for the purpose of performing validations and reviews. The supporting infrastructure was rehosted in the cloud with minimal architectural changes. The workstream developed a modern cloud architecture and supporting infrastructure/services to demonstrate efficiencies gained in transitioning to a cloud-native architecture. 

The scope of the NCCoE ACMVP project focused on machine readable payloads to ensure the completeness, accuracy and consistency of validation submissions to automate the validation process. 

The capabilities described in this guide are actively being integrated into the production CMVP environment in 2026 to support a faster time-to-market of validated cryptographic modules.

The primary goal of the guide is to describe the NCCoE-developed automation application, process, and protocols as they are being integrated into the NIST CMVP. These descriptions are intended to help cryptographic and security testing labs, technology producers, and validation authorities leverage this modern approach to shorten the validation cycle while maintaining and improving assurance levels. 

A secondary goal of the guide is to provide practical information that can be applied to the CMVP infrastructure to further modernize the underlying systems and applications and support leveraging cloud-native services to maximize the efficiency of validation processes.
