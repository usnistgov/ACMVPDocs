Protocol Workstream
=========================

The ACMVP Protocol Workstream is led by Barry Fussell and Andrew Karcher of Cisco and Chris Celi of NIST with contributions from Panos Kampanakis of Amazon, Michael McCarl and Deborah Harrington of Aegisolve, Alex Thurston of Lightship, Stephan Mueller and Walker Riley of atsec, Mike Grimm of Microsoft, Robert Staples of NIST, and Raoul Gabiam, Michael Dimond, Kyle Vitale, Doris Rui, and Matthew Fortes of the MITRE Corporation.

The Protocol WS is responsible for defining the interactions between automated CMVP server assets and the NCCoE ACMVP clients supporting a proof-of-concept of automation capabilities. The proof-of-concept server currently implements the following features:

#.	Two-factor authentication using time-based one-time passwords (TOTPs) and mTLS. This system improves the TOTP from the Automated Cryptographic Validation Protocol (ACVP) by allowing a user to maintain multiple seeds for simultaneous connections.

#.	Module registration that defines the security levels, embodiments, and other properties of the cryptographic module. This is used to automatically determine which TEs are applicable to the cryptographic module.

#.	Module evidence catalogue submission that prompts a client to provide evidence addressing TEs that are applicable to the cryptographic module. The system will inform you which TEs have not yet been addressed by the submission to ensure completeness. 

#.	Module security policy submission defined entirely in JSON. The system will generate the security policy automatically, allowing the client to retrieve the completed PDF. This ensures that all sections are present and completed.

#.	Award of a validation certificate once all evidence catalogue and security policy information are completed.

The proof-of-concept includes both client and server components.

#.	The server uses much of the same infrastructure as ACVP and Entropy Source Validation (ESV). This is intentional in order to use the same team to maintain the systems once they are integrated by the CMVP. This is mainly C# applications along with SQL Server databases. The server development team is also using this opportunity to re-evaluate security assurances within NIST to see if any improvements can be brought back into the rest of the CMVP applications.

#.	Two client examples have been developed:

    #. Cisco's Libamvp is C-based and interacts with the server by parsing user-generated JSON. It is intended to be a simple tool to showcase the protocol and assist developers as they create workflows for the generation and submission of AMVP data. Libamvp can create modules and certification requests, submit all required evidence catalogue and security policy info, retrieve security policy PDFs, check for the status of a certification request, and more, as development continues. The code is open-source and is available at the public repository https://github.com/cisco/libamvp.

    #. The atsec ACVP Proxy provides the interface to access the NIST ACVP, Entropy Source Validation Program (ESVP), and AMVP services. The code is open-source and is available at the public repository https://github.com/smuellerDD/acvpproxy. The ACVP Proxy allows a flexible deployment and is extendable to cover an arbitrary number of Implementation Under Test (IUT) definitions. It implements the entire interaction with the NIST servers to obtain the data from the server and upload all required data to the server.

The protocol effort is still in progress. Work planned for the next year includes:

#.	Demonstrating the ability for the CMVP staff to use an API to handle “comment round” interactions with NVLAP-accredited parties 

#.	Enabling automatic processing of functional test evidence (FE-TEs) based on the test type selected by NVLAP-accredited laboratories

#.	Enabling acceptance of source code TEs (SC-TEs) and other TEs (OD-TEs) not yet handled by the server
