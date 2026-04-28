Appendix C: CMVP Demo Server
=============================================

.. toctree::
   :maxdepth: 2
   :titlesonly:
   :glob:
   :hidden:

   technicalDetails.rst

Accessing the ACMVP Demo Server
--------------------------------

A CSR is not be needed to access the ACMVP Demo server if a user already has an ACVTS Demo or ESVTS Demo server certificate. Said user will only need to send an email to amvp-demo@nist.gov to request access to the ACMVP Demo server.

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
