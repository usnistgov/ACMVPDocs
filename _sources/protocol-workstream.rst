Protocol Workstream 
=====================

The Protocol Workstream defines the interactions between the automated CMVP server and the ACMVP clients supporting a proof-of-concept of automation capabilities. The CMVP hosts a demonstration server for interoperability and testing purposes through NIST. This is referred to as the ACMVP Demo Server covered in :ref:`Accessing the ACMVP Demo Server`. 

Protocol Workstream Collaborators
------------------------------------

The ACMVP Protocol Workstream is led by Barry Fussell and Andrew Karcher of Cisco and Christopher Celi of NIST, with contributions from Panos Kampanakis of Amazon, Michael McCarl and Deborah Harrington of AEGISOLVE, Alex Thurston of Lightship, Stephan Mueller and Walker Riley of atsec information security, Mike Grimm of Microsoft, Chih-Kao Liao of Intertek, Robert Staples of NIST, and Raoul Gabiam, Michael Dimond, Kyle Vitale, Doris Rui, and Matthew Fortes of the MITRE Corporation.

Proof-of-Concept Server Features
---------------------------------

The proof-of-concept server currently implements the following features:

- Two-factor authentication using TOTP and mTLS, which improves the TOTP from ACVP by allowing a user to maintain multiple seeds for simultaneous connections.
- Module registration that defines the security levels, embodiment, and other properties of the cryptographic module, and automatically determines which TEs are applicable to the cryptographic module.
- Module evidence submission that prompts a client to provide evidence addressing TEs that are applicable to the cryptographic module, and will show which TEs have not yet been addressed by the submission to ensure completeness. 
- Module security policy submission defined entirely in JSON, which will generate the security policy automatically, allowing the client to retrieve the completed document, and ensuring that all sections are present and completed.
- Automatic processing of functional test evidence (FT-TEs) based on the test type selected by the lab.
- Accepts source code test evidence (SC-TE) based on the test procedure selected by the lab.
- Provides endpoints that list the accepted schemas for submission endpoints and defines a query to obtain a specific version of a schema.
- Handles other documentation test evidence (OD-TE), rounding out all the evidence types defined by the TE Workstream.
- Applies an automated rule checking engine on completed submissions. This is introduced on the ACMVP Demo Server as a proof of concept to do things like ensure a submission is consistent with itself. Submissions for a full module can be very large, needing several hundred TEs addressed, cryptographic algorithm and entropy source validations, etc. The rule checks can be expanded to complete cross-references to algorithm and entropy certificates to ensure that all content in the current request is accurate. Much of this work is done manually by a reviewer looking at the publicly available algorithm validation certificate and the registered capabilities of the submitted cryptographic module. 

Server Implementation
----------------------

The server uses much of the same infrastructure as ACVP and ESV, which is intended to keep the same team available to maintain the systems once they are integrated by the CMVP. The system is comprised of C# and Python applications along with SQL Server databases.

The server implementation can be broken down into two major applications. The first is WebPublic, the front-facing application that serves the application programming interface (API) with which clients interact. This application handles HTTPS requests from users to retrieve or submit data to the CMVP. The second application is the MessageQueueProcessor. As tasks to create or update data are collected through WebPublic, they enter a queue. The MessageQueueProcessor reads those requests using a first-in, first-out ordering to fulfill them. This handles the core logic of creating modules, applying the TE Filter, building security policy documents, and running the core automation checks on a module seeking validation. 

Client Implementations
-------------------------

This section describes the two open-source clients, Libamvp and ACVP Proxy, that provide foundational code for developers to build upon when interfacing with the server.

Libamvp - Cisco
________________

Libamvp is an example client for the AMVP protocol developed by Cisco engineers. It is C-based and interacts with the server by parsing user-generated JSON and is intended to be a simple tool to showcase the protocol and assist developers as they create workflows for the generation and submission of AMVP data. Libamvp can create modules and certification requests, submit all required evidence and security policy information, retrieve security policy PDFs, check for the status of a certification request, and perform other actions, as development continues.

Libamvp can be found here: https://github.com/cisco/libamvp.

ACVP Proxy - atsec information security
_________________________________________

The client is called the ACVP Proxy and is supported by atsec information security. The name is ACVP Proxy because this is a continuation of an older project designed to interact with the NIST ACVP servers. It now provides the interface to access the NIST ACVP, ESV, and ACMVP services. The code is open source and available at the public repository: https://github.com/smuellerDD/acvpproxy.

The ACVP Proxy has many options, allows a flexible deployment, and is extendable to cover an arbitrary number of IUT definitions. The ACVP Proxy implements the entire interaction with the NIST servers to obtain the data from the server and upload all required data to the server.

Accessing the ACMVP Demo Server
--------------------------------

Detailed instructions on accessing the ACMVP Demo Server hosted by NIST can be found at https://pages.nist.gov/ACMVPDocs/protocol/index.html#accessing-the-acmvp-demo-server.
