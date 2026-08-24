Protocol Workstream 
=====================

.. toctree::
   :titlesonly:
   :maxdepth: 4
   :glob:
   :hidden:

   protocol/index.rst

The Protocol Workstream defines the interactions between the automated CMVP server and the ACMVP clients supporting a proof-of-concept of automation capabilities. The CMVP hosts a demonstration server for interoperability and testing purposes through NIST. This is referred to as the ACMVP Demo Server. The ACMVP Demo Server supports testing labs to connect the outputs of their testing results with the CMVP with minimal human intervention, enabling streamlined submissions with less potential for delay.
and to support testing labs to connect the outputs of their testing results with the CMVP with minimal human intervention.


Protocol Workstream Collaborators
------------------------------------

The ACMVP Protocol Workstream is led by Barry Fussell and Andrew Karcher of Cisco and Christopher Celi of NIST, with contributions from Panos Kampanakis of Amazon, Michael McCarl and Deborah Harrington of AEGISOLVE, Alex Thurston of Lightship, Stephan Mueller and Walker Riley of atsec information security, Mike Grimm of Microsoft, Chih-Kao Liao of Intertek, Robert Staples of NIST, and Raoul Gabiam, Michael Dimond, Kyle Vitale, Doris Rui, and Matthew Fortes of the MITRE Corporation.

Technical Details
-------------------

Intro
________

The Automated Module Validation Protocol (AMVP) defines a mechanism to submit registration, test evidence and validation requests for a software, firmware and hardware crypto modules. It works in conjunction with ACVTS and ESVTS to improve the speed of validations at a rate which meets typical industry development cycles; providing the ability to deploy validated crypto with CVE fixes much faster than previous methods.

The AMVP specification describes how the protocol is structured with respect to the client-server model, messaging, optional features, and flows. It defines how the registrar and evidence submission client communicates with an AMVP server; including module capabilities, session management, authentication, vector processing and more. AMVP leverages many of the message flows originally defined for ACVP and incorporates them into a module-specific concept and adds new flows for module test evidence submission and validation requests.


Protocol Overview
___________________

AMVP has the following goals:

- To communicate registration information for one to many cryptographic modules for lab, vendor, module and OE.
- To submit test evidence as defined by FIPS SP 800-140Br1.
- To enable automated registration and test evidence submission with minimal human interaction.
- To provide extensibility that can be used to introduce registration for new module types and new test evidence as needed.
- To be compatible with emerging automated validation systems wherever possible, especially the FIPS-140 Cryptographic Module Validation Program.

AMVP defines how to communicate registration information, test evidence and validation requests with a validation authority. It is dependent upon existing technologies such as HTTPS, JSON and TLS to perform the message exchanges. In addition it is dependent on submissions to the validation authority from ACVP and the ESV protocol. The relationship between the three protocols can be summarized as follows.

- AMVP registers the lab, vendor, module and OE information.
- ACVP performs algorithm testing on an OE and submits the results assigned to the module/OE registered by AMVP.
- ESV performs entropy testing on an OE and submits the results assigned to the module/OE registered by AMVP.
- AMVP submits additional module-centric test evidence and documentation to meet FIPS SP 800-140Br1 requirements.
- AMVP submits a request for FIPS 140-3 module validation.

Protocol Audience
''''''''''''''''''

This document is written to address multiple audiences:

- Crypto module developers who require validation testing
- Crypto validation organizations who will perform validation testing
- Crypto module customers that desire validation testing results or verifiable artifacts of testing

Goals
'''''''

The goals for this document are to provide a messaging protocol that can be used with existing authentication and communication protocols to provide a way to validate crypto modules. The following functions are outside the scope of this document:

- The API to the cryptographic module
- Where AMVP is located within the client premise
- How the results/artifacts are stored or managed
- Scalability
- Management interface

Strategy
'''''''''''

To meet the goals laid out here the strategy must be:

- To perform module registration in such a way the server is able to limit requests to only applicable evidence sets
- To provide evidence that avoids free text and replaces it with structured reproducible schema so it is automatable
- To provide registration such that information is available to generate a security policy which meets SP 800-140B

Architecture
________________

.. raw:: html
    :file: protocol/html/03-architecture.html

AMV Protocol
________________

.. raw:: html
    :file: protocol/html/04-amvprotocol.html

Security
________________

.. raw:: html
    :file: protocol/html/05-security.html

Login
__________

.. raw:: html
    :file: protocol/html/07-login.html

Versioning
___________

.. raw:: html
    :file: protocol/html/08-versioning.html

Messaging
__________

.. raw:: html
    :file: protocol/html/09-messaging.html

Error Responses
___________________

.. raw:: html
    :file: protocol/html/11-errorresponses.html

Examples
__________

.. raw:: html
    :file: protocol/html/14-appendix.html
