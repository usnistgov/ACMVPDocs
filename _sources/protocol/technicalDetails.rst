Protocol Workstream Technical Details
======================================

.. toctree::
   :maxdepth: 3
   :titlesonly:
   :glob:
   :hidden:

   securityConsiderations.rst
   login.rst
   versioning.rst
   messaging.rst
   errorResponses.rst

Intro
-------

The Automated Module Validation Protocol (AMVP) defines a mechanism to submit registration, test evidence and validation requests for a software, firmware and hardware crypto modules. It works in conjunction with ACVTS and ESVTS to improve the speed of validations at a rate which meets typical industry development cycles; providing the ability to deploy validated crypto with CVE fixes much faster than previous methods.

The AMVP specification describes how the protocol is structured with respect to the client-server model, messaging, optional features, and flows. It defines how the registrar and evidence submission client communicates with an AMVP server; including module capabilities, session management, authentication, vector processing and more. AMVP leverages many of the message flows originally defined for ACVP and incorporates them into a module-specific concept and adds new flows for module test evidence submission and validation requests.


Overview
----------

AMVP has the following goals:

- To communicate registration information for one to many cryptographic modules for lab, vendor, module and OE.
- To submit test evidence as defined by FIPS SP800-140Br1.
- To enable automated registration and test evidence submission with minimal human interaction.
- To provide extensibility that can be used to introduce registration for new module types and new test evidence as needed.
- To be compatible with emerging automated validation systems wherever possible, especially the FIPS-140 Cryptographic Module Validation Program.

AMVP defines how to communicate registration information, test evidence and validation requests with a validation authority. It is dependent upon existing technologies such as HTTPS, JSON and TLS to perform the message exchanges. In addition it is dependent on submissions to the validation authority from ACVP and the ESV protocol. The relationship between the three protocols can be summarized as follows.

- AMVP registers the lab, vendor, module and OE information.
- ACVP performs algorithm testing on an OE and submits the results assigned to the module/OE registered by AMVP.
- ESV performs entropy testing on an OE and submits the results assigned to the module/OE registered by AMVP.
- AMVP submits additional module-centric test evidence and documentation to meet FIPS SP800-140Br1 requirements.
- AMVP submits a request for FIPS 140-3 module validation.

Audience
_________

This document is written to address multiple audiences:

- Crypto module developers who require validation testing
- Crypto validation organizations who will perform validation testing
- Crypto module customers that desire validation testing results or verifiable artifacts of testing

Goals
_______

The goals for this document are to provide a messaging protocol that can be used with existing authentication and communication protocols to provide a way to validate crypto modules. The following functions are outside the scope of this document:

- The API to the cryptographic module
- Where AMVP is located within the client premise
- How the results/artifacts are stored or managed
- Scalability
- Management interface

Strategy
_________

To meet the goals laid out here the strategy must be:

- To perform module registration in such a way the server is able to limit requests to only applicable evidence sets
- To provide evidence that avoids free text and replaces it with structured reproducible schema so it is automatable
- To provide registration such that information is available to generate a security policy which meets SP800-140B

Architecture
-------------

A server/client/proxy model is used where the roles are defined as:

- AMV Client/Proxy - Communicates with the AMV server using Java Script Object Notation (JSON [RFC7159]) and submits registration for various resources and test evidence that is module-centric.
- AMV Server - Maintains registration information and processes test evidence for module validation requests.

AMV Protocol
--------------

The AMV protocol will utilize existing mechanisms for transport coordinated with JSON formatted messaging.

Protocol Layering
__________________

.. code-block:: rst

    +-----------------------------------------------+
    | JSON Formatted AMVP request/response messages |
    +-----------------------------------------------+
    | HTTP[S] message transfer and signaling        |
    +-----------------------------------------------+
    | TLS for transport security                    |
    +-----------------------------------------------+
    | TCP for transport                             |
    +-----------------------------------------------+

HTTP URI Hierarchy
___________________

.. code-block:: rst

    +-------------+------+---------+------------+
    |   server    |path  | version | resource   |
    |             |prefix|         |            | 
    +-------------+------+---------+------------+
    |https://amvts.nist.gov/amvp/v1/certRequests|
    +-------------+------+---------+------------+