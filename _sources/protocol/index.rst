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
The Protocol Workstream is defining the interactions between automated CMVP server assets and the NCCoE ACMVP clients supporting a proof-of-concept of automation capabilities. This section captures the progress made since the last report was released in September 2024. 

Contributions and Acknowledgements
________________________________________

The ACMVP Protocol Workstream is led by Barry Fussell and Andrew Karcher of Cisco  and Chris Celi of NIST with contributions from Panos Kampanakis of Amazon, Michael McCarl and Deborah Harrington of AEGISOLVE, Alex Thurston of Lightship, Stephan Mueller and Walker Riley of atsec, Mike Grimm of Microsoft, Robert Staples of NIST, and Raoul Gabiam, Michael Dimond, Kyle Vitale, Doris Rui, and Matthew Fortes of the MITRE Corporation.

The Protocol Workstream is responsible for defining the interactions between automated CMVP server assets and the NCCoE ACMVP clients supporting a proof-of-concept of automation capabilities. This section captures the progress made since the last report was released in September 2024. 

Proof-of-Concept Server Features
----------------------------------

The proof-of-concept server currently implements the following features:
- Two-factor authentication using TOTP and mTLS. This system improves the TOTP from ACVP by allowing a user to maintain multiple seeds for simultaneous connections.
- Module registration that defines the security levels, embodiment, and other properties of the cryptographic module. This is used to automatically determine which TEs are applicable to the cryptographic module.
- Module evidence submission that prompts a client to provide evidence addressing TEs that are applicable to the cryptographic module. The system will inform you which TEs have not yet been addressed by the submission to ensure completeness. 
- Module security policy submission defined entirely in JSON. The system will generate the security policy automatically, allowing the client to retrieve the completed PDF. This ensures that all sections are present and completed.
- Awards a validation certificate once all evidence and security policy information are completed.
- Comment rounds handled through the API.
- Automatic processing of functional test evidence (FE-TEs) based on the test type selected by the lab.
- Accept source code test evidence based on the test procedure selected by the lab.

Server Implementation
----------------------

The server uses much of the same infrastructure as ACVP and ESV. This is intentional in order to keep the same team available to maintain the systems once they are integrated by the CMVP. This is mainly C# applications along with SQL Server databases.

The server development team is also using this opportunity to re-evaluate the required security assurances within NIST to see if any improvements can be brought back into the rest of the CMVP applications. This includes the requirement for 2FA, separation between internal and external systems, ITAR restrictions, and other elements that are a part of the ACVP and ESV systems.

Client Implementations
-------------------------

Libamvp - Cisco
________________

Libamvp is an example client for the AMVP protocol developed by Cisco engineers. It is C based and interacts with the server by parsing user-generated JSON. It is intended to be a simple tool to showcase the protocol and assist developers as they create workflows for the generation and submission of AMVP data. Libamvp can create modules and certification requests, submit all required evidence and security policy info, retrieve security policy PDFs, check for the status of a certification request, and more, as development continues.

Libamvp can be found here: https://github.com/cisco/libamvp.

ACVP Proxy - atsec
___________________

The client is called the ACVP Proxy and is supported by atsec information security corp. Albeit the name, it provides the interface to access the NIST ACVP, ESVP, and AMVP services. The code is open sourced and available at the public repository: https://github.com/smuellerDD/acvpproxy.

The ACVP Proxy has many options and allows a flexible deployment. It is extendable to cover an arbitrary number of IUT definitions. The ACVP Proxy implements the entire interaction with the NIST servers to obtain the data from the server and upload all required data to the server.

Accessing the ACMVP Demo Server
--------------------------------

Here are the instructions and steps to request access to the upcoming Demo environment.

Send a CSR (Certificate Signing Request) file to the CMVP via the Secure File Communication service found at the URL https://sfc.doc.gov. Please note that, due to policy, a CSR cannot be accepted via email or email attachment; it must be sent through the SFC system. To establish an account on SFC, send an email to amvp-demo@nist.gov.

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

2. Upon receipt of your CSR file, the CMVP will validate that it meets the above stated requirements. If there are any issues, the CMVP will point out via email response what needs to be corrected.

3. Once the certificate is generated, notification will be sent with the certificate and TOTP seed via an SFC message. The credentials will be valid immediately upon receipt.

Users are expected to protect the key pair from unauthorized use and to notify NIST in the event the keypair becomes compromised in any way.

Note that per policy, SFC accounts and attachments are only valid for 2 calendar weeks from when the invitation email is sent. If you already have an active SFC account, it may be used it to send the CSR file, but please begin the process by sending the initial request to amvp-demo@nist.gov. 

Note that external SFC accounts will go dormant after 2 weeks by NIST policy - this is normal behavior. After the certificate is exchanged, there is no further need for SFC. Additionally the account can be reinstated at any point in time by going through the same process.

Planned Work
--------------

The work is still in progress. Here are some features that will be addressed over the next six months:

- Continue developing automated checklist rules to ensure submissions are as correct as possible before entering the hands of a reviewer.
- Add reviewer comment rounds to the protocol and implementations rather than handle them out of band over encrypted email.