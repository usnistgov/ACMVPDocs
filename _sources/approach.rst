Approach
==========

Audience
---------

The primary audience for this report is technology, security, and privacy program managers and architects, software developers, engineers, and IT professionals, especially those involved with the CMVP, accredited cryptography and security testing labs, and conformance offices at companies that produce security software and hardware.

Scope
------

The project demonstrates tools that will modernize and automate manual review processes in support of existing CMVP policy. The scope of the project is focused on enabling an accredited lab to make a full module submission to the CMVP. This includes technical testing evidence reported to the CMVP and the construction of a security policy document that goes on the final module validation certificate. The automated tools use a server/client testing model, allowing testing labs to submit reports to the CMVP incrementally. Due to the server-based implementation acting on behalf of the CMVP, automated review can occur before a submission reaches the CMVP. The scope of the ACMVP project activities encompassed the following tasks to allow for automating module validation of a new module submission at any security level: 

- a list of standard test methods for the functional testing of modules,

- a full reporting of applicable functional and non-functional security requirements,

- a cloud-based infrastructure to host the environment at NIST,

- and a protocol that can enable the generation and validation of standardized evidence produced by the operational testing of an Implementation Under Test (IUT).

While evaluating automation for a software module which was the initial project scope, it was found that enabling hardware modules for automation was not a significant addition. As a result, the ACMVP has focused on all modules (software and hardware) across security levels 1 through 4, with their first submissions to the CMVP. Future phases can help automate other submission types for the CMVP, such as submissions that address only Critical Vulnerability Enumerations (CVEs) or submissions to add operating environments to an existing validation.

Workstreams
-------------

The project was organized into three workstreams: the Test Evidence (TE) Workstream, the Protocol Workstream, and the Research Infrastructure Workstream.

The structured application of the TE classification and filtering proposed by the TE Workstream plays a crucial role in streamlining the validation process for cryptographic modules under FIPS 140-3. The TE classification categorizes requirements so that the developed proof of concept ACMVP server can require direct body of evidence. By leveraging both basic and supplemental filters, the evaluation process ensures that only relevant test evidence is considered, reducing redundancy while maintaining rigorous security standards. This approach enhances efficiency, supports automation, and enables a more scalable validation framework. This shifts the applicability of requirements to a centralized community consensus rather than treating them as an additional item for the reviewer to consider. 

The Protocol Workstream defines the interactions between the CMVP server and the ACMVP clients supporting a proof-of-concept of automation capabilities. The system is inspired by the `Automated Cryptographic Validation Protocol (ACVP) <https://pages.nist.gov/ACVP/>`__ and supports a full module submission to the CMVP. This includes describing the capabilities of the module, addressing how each requirement from FIPS 140-3 is met, and generating a security policy. It integrates with WebCryptik to provide a front-end for generating large JavaScript Object Notation (JSON) payloads and leverages the CMVP's internal security policy builder application to ensure consistent documentation. 

The ACMVP project is cloud-based. The Research Infrastructure Workstream team adopted an iterative approach to modernize the CMVP supporting infrastructure to complement the developed proof of concept ACMVP server. Each iteration introduced progressively advanced architectures, leveraging cloud-native services to improve scalability, portability, deployment speed, and security of the modernized application. The modernization efforts have resulted in a containerized server application compatible with both Windows and Linux platforms. It integrates a managed database service to enhance operational efficiency and features a fully automated Continuous Integration/Continuous Deployment (CI/CD) pipeline to simplify and streamline deployments on a Linux platform. Authentication mechanisms have been modernized to incorporate cloud-native solutions, including the AWS Network Load Balancer (NLB).

The combined impact of these workstreams is automation and improvements to the CMVP's operations.

Assumptions
------------

The CMVP handles many submission types for modules seeking validations or revalidations. Modules may wish to add algorithms, not impacting other previously validated functionality. Modules may wish to update a version to address a reported CVE. ACMVP acknowledges that there are many more submission types than a full module submission for initial validation. The project operates under the assumption that a full module submission will cover the techniques and tools needed to apply to other, more specific submission types. This extension can be handled by the CMVP or by an interested community such as the `Cryptographic Module User Forum <https://www.cmuf.org/>`__ (CMUF).

An additional assumption made by this project is that fully automated module validation is not the immediate goal of the project. Many tasks performed manually by CMVP reviewers can and are automated by ACMVP. The goal of the project is to reduce the amount of manual work done, but not necessarily eliminate it entirely. A human reviewer will be needed to ensure a submission makes coherent sense, for example, a network switch is not submitted as a software module. 

Workflow of an Automated CMVP
-------------------------------

The ACMVP Process Workflow diagram in Figure 1 expresses the expected data exchange between an accredited Lab and the CMVP for the steps in the formal submission of the evidence, supporting documents, and request for validation. The left side of the diagram represents the work performed and the data exchanged by the Lab while the right side represents this workflow from the CMVP perspective. The center line represents the network boundary for the transmission and retrieval of the corresponding JSON payloads between the Lab and CMVP. The workflow diagram is divided horizontally into phases of the ACMVP protocol as described by their individual subtitles. The following is a high-level description of each one of the well-defined phases of the workflow.


.. figure:: images/Approach-Figure1.png
    :alt: Figure one depicts the workflow of an automated CMVP
    :align: center

    **Workflow of an automated CMVP**


Request Schema(s)
__________________

Simplifying the process and ensuring valid JSON payload submissions, ACMVP offers the authoritative JSON Schemas for each of the JSON payload submission types. 

JSON Schemas currently available:

* Certificate Request Registration
* Functional Test Evidence Submission
* Other Documentation Evidence Submission
* Security Policy Submission (module.json)
* Source Code Evidence Submission 

Request Start of Validation and Register Module (Capabilities)
________________________________________________________________

A Module Validation workflow is initiated with a Module Certificate Request from the Lab to CMVP which includes the vendor's Module capabilities and uniquely identify the Implementation Under Test (IUT). In response, CMVP will provision a Certificate Request identifier and generate a scoped list of Test Evidence Identifiers (TEs) which requires Lab submitted rationale and captured evidence metadata.

Submit Evidence Catalogs
__________________________

The heavy lifting begins with the Lab capturing all of the relevant evidence from Functional Testing, Source Code, and relevant vendor documentation. While capturing the evidence, the Lab submits selected metadata, referred to as evidence catalog, for each of the previously identified TEs identified by CMVP for validation of a module with the claimed capabilities. The module testing, evidence gathering, and evidence catalog submissions can be done as a complete package, a group of submissions, or even individually for each identified TE allowing for significant flexibility for the Lab. With each submission, CMVP will acknowledge receipt of the submission which should not be interpreted as validation results just yet.

Submit Additional Documentation
_________________________________

Module validations often require in review of various lab, vendor, and technology specific documentation (eg. Remote Testing, Physical Security, etc.) in order for CMVP to properly validate the Module has been properly tested and is fully conformant to the current cryptographic and security requirements. This phase enables Lab submission of all relevant and supportive documentation.

Request / Update Security Policy
___________________________________

Significantly simplifying the Security Policy document generation stems from the reduction to Lab submission of individual Security Policy sections with content to be inserted into a CMVP defined Security Policy template. This reduces the workload in preparation and submission while ensuring consistent content, look and coverage is guaranteed by CMVP's generation and publishing of the final Security Policy document according to their template. Reduces resource drain for everyone while ensuring consistency. As is enabled with the evidence catalog submissions, this phase enables iterative submissions to CMVP as information becomes available to the lab. 

Request Publication
__________________________

The final phase of a Module Validation workflow is the Request Publication. This phase triggers the formal Validation by CMVP involving an iterative Coordination with the Lab and finalization resulting in posting of Security Policy, and the Module Validation Certificate. 
