Protocol Workstream
=========================

.. toctree::
   :maxdepth: 2
   :titlesonly:
   :glob:
   :hidden:

   technicalDetails.rst


Introduction
-------------

The Protocol Workstream defines the interactions between automated CMVP server assets and the NCCoE ACMVP clients supporting a proof-of-concept of automation capabilities. This section captures the progress made since the last report in September 2024.

The ACMVP Protocol Workstream is led by Barry Fussell and Andrew Karcher of Cisco and Chris Celi of NIST with contributions from Panos Kampanakis of Amazon, Michael McCarl and Deborah Harrington of AEGISOLVE, Alex Thurston of Lightship, Stephan Mueller and Walker Riley of atsec, Mike Grimm of Microsoft, Robert Staples of NIST, and Raoul Gabiam, Michael Dimond, Kyle Vitale, Doris Rui, and Matthew Fortes of the MITRE Corporation.

Proof-of-Concept Server Features
----------------------------------

The proof-of-concept server currently implements the following features:
- Two-factor authentication using TOTP and mTLS, which improves the TOTP from ACVP by allowing a user to maintain multiple seeds for simultaneous connections
- Module registration that defines the security levels, embodiment, and other properties of the cryptographic module and automatically determines which TEs are applicable to the cryptographic module
- Module evidence submission that prompts a client to provide evidence addressing TEs that are applicable to the cryptographic module and will show which TEs have not yet been addressed by the submission to ensure completeness
- Module security policy submission defined entirely in JSON, which will generate the security policy automatically, allowing the client to retrieve the completed PDF, and ensures that all sections are present and completed.
- The awarding of a validation certificate once all evidence and security policy information are completed
- Automatic processing of functional test evidence (FE-TEs) based on the test type selected by the lab
- Acceptance of source code test evidence based on the test procedure selected by the lab

Server Implementation
----------------------

The server uses much of the same infrastructure as ACVP and ESV, which is intended to keep the same team available to maintain the systems once they are integrated by the CMVP. The system is comprised of C# and Python applications along with SQL Server databases.

The server development team is also using this opportunity to re-evaluate the required security assurances within NIST to see if any improvements can be implemented into the rest of the CMVP applications, which includes the requirement for Two-Factor authentication, separation between internal and external systems, International Traffic and Arms Restrictions (ITAR), and other elements of the ACVP and ESV systems.

Client Implementations
-------------------------

This section describes the two open source clients, Libamvp and ACVP Proxy, that provide foundational code for developers to build upon when interfacing with the server.

Libamvp - Cisco
________________

Libamvp is an example client for the AMVP protocol developed by Cisco engineers. It is C based and interacts with the server by parsing user-generated JSON and is intended to be a simple tool to showcase the protocol and assist developers as they create workflows for the generation and submission of AMVP data. Libamvp can create modules and certification requests, submit all required evidence and security policy information, retrieve security policy PDFs, check for the status of a certification request, and other actions, as development continues.

Libamvp can be found here: https://github.com/cisco/libamvp.

ACVP Proxy - atsec
___________________

The client is called the ACVP Proxy and is supported by atsec information security corp. It provides the interface to access the NIST ACVP, ESVP, and AMVP services using an open sourced code that is available at the public repository: https://github.com/smuellerDD/acvpproxy.

The ACVP Proxy has many options, allows a flexible deployment, and is extendable to cover an arbitrary number of IUT definitions. The AVP Proxy implements the entire interaction with the NIST servers to obtain the data from the server and upload all required data to the server.

Accessing the ACMVP Demo Server
--------------------------------

Here are the instructions and steps to request access to the upcoming demo environment:

Send a CSR (Certificate Signing Request) file to the CMVP via the Secure File Communication service found at the URL https://sfc.doc.gov. Due to policy, a CSR cannot be accepted via email or email attachment and must be sent through the SFC system. To establish an account on SFC, send an email to amvp-demo@nist.gov.

Please send the CSR file in PEM format following these requirements:

1. Use this naming convention for your CSR:

    - OrganizationName_FirstName_LastName_AMVPDemo.csr
        - No spaces in the filename
        - No more than 3 underscore "_" characters in the filename
    - Do not zip the file; send it exactly as specified above. Any file submitted beyond a reasonable CSR size (maximum 10KB) will be automatically rejected. 
    - Use a minimum 2048-bit RSA key pair.
    - Sign using at least a SHA-256 hash.
    - Include the EMAILADDRESS attribute in the certificate subject. If a single user email address is used, the generated certificate is non-transferable. This can either be the user's email address OR a group alias email address (if applicable). If a single user email address is used, the generated certificate is non-transferable.
    - Include the CN attribute in the certificate subject. This can either be the user's first and last name OR the name of the organization.
    - No URLs in the CN attribute.
    - If you are submitting multiple CSRs using your organization's name and group email alias, the CN attribute *must* be unique for each submission.
    - For example: CN=Orgname 1, CN=Orgname 2, CN=Orgname 3, etc. If this requirement is not met, the submission will be rejected with feedback to fix the error.
    - Ensure the C (country) attribute is only two letters.

    For example:
        EMAILADDRESS=email.address@domain.com, CN=firstname lastname, OU=organization.unit, O=organization.name, L=city, ST=state, C=country.abbreviation

    Here are the openssl commands you will need to generate a CSR:

    .. code-block:: bash

        openssl genrsa -out private-key-name.key 4096
        openssl req -new -key private-key-name.key -out OrganizationName_FirstName_LastName_AMVPDemo.csr -sha256

2. Upon receipt of the CSR file, the CMVP will validate that it meets the above stated requirements and will point out via email response what needs to be corrected if there are any issues

3. Once the certificate is generated, a notification will be sent with the certificate and TOTP seed via an SFC message and the credentials will be valid immediately upon receipt

Users are expected to protect the key pair from unauthorized use and to notify NIST in the event the keypair becomes compromised in any way.

Note that per policy, SFC accounts and attachments are only valid for two calendar weeks from when the invitation email is sent. Existing SFC accounts may be used to send the CSR file but it is advised to begin the process by sending the initial request to amvp-demo@nist.gov.

Note that external SFC accounts will go dormant after two weeks by NIST policy, which is normal behavior. After the certificate is exchanged, there is no further need for SFC.

Additionally, the account can be reinstated at any point in time by going through the same process.

Planned Work
--------------

The work is still in progress. Here are some features that will be addressed by Fall 2025:

- Continue developing automated checklist rules to ensure submissions are as correct as possible before entering the hands of a reviewer 
- Add reviewer comment rounds to the protocol and implementations rather than handle them out of band over encrypted email
- Begin integrating ACMVP research products into the production CMVP workflows