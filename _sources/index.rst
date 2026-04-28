**NIST SPECIAL PUBLICATION 1800-40B**

Automation of the NIST Cryptographic Module Validation Program
===============================================================

+----------------------------------------+------------------------------+
| **Christopher Celi**                   | **Raoul Gabiam**             |
|                                        |                              |
| **Alex Calis**                         | *The MITRE Corporation*      |
|                                        |                              |
| **Murugiah Souppaya***                 |                              |
|                                        |                              |
| *Computer Security Division*           | **Stephan Mueller**          |
|                                        |                              |
| *Information Technology Laboratory*    | **Yi Mao**                   |
|                                        |                              |
|                                        | *atsec information security* |
|                                        |                              |
| **William Barker**                     |                              |
|                                        |                              |
| *Domestic Guest Researcher*            | **Barry Fussell**            |
|                                        |                              |
| *Information Technology Laboratory*    | **Andrew Karcher**           |
|                                        |                              | 
| **Karen Kent**                         | *Cisco*                      |
|                                        |                              |
| *Trusted Cyber Annex*                  |                              |
|                                        |                              |
|                                        | **Douglas Boldt**            |
|                                        |                              |
| **Shawn Geddis**                       | *Amazon Web Services*        |
|                                        |                              |
| *Katalyst*                             |                              |
|                                        |                              |
+----------------------------------------+------------------------------+

\*Former employee; all work for this publication was done while at that organization.

April 2026

INITIAL PUBLIC DRAFT

Disclaimer
-----------

Certain commercial entities, equipment, products, or materials may be identified by name or company logo or other insignia in order to acknowledge their participation in this collaboration or to describe an experimental procedure or concept adequately. Such identification is not intended to imply special status or relationship with NIST or recommendation or endorsement by NIST or NCCoE; neither is it intended to imply that the entities, equipment, products, or materials are necessarily the best available for the purpose.

While NIST and the NCCoE address goals of improving management of cybersecurity and privacy risk through outreach and application of standards and best practices, it is the stakeholder's responsibility to fully perform a risk assessment to include the current threat, vulnerabilities, likelihood of a compromise, and the impact should the threat be realized before adopting cybersecurity measures such as this recommendation.

National Institute of Standards and Technology Special Publication 1800-40, Natl. Inst. Stand. Technol. Spec. Publ. 1800-40B, 89 pages, (April 2026), CODEN: NSPUE2

Feedback
-----------

You can view or download the guide at the NCCoE Automation of the NIST Cryptographic Module Validation Program project page. 

With this initial public draft of the final report, NIST NCCoE is now asking for feedback where clarifications might be beneficial. 

Comments on this publication may be submitted to: applied-crypto-testing@nist.gov

Public comment period: April 15, 2026 through June 1, 2026

All comments are subject to release under the Freedom of Information Act.

| National Cybersecurity Center of Excellence
| National Institute of Standards and Technology
| 100 Bureau Drive
| Mailstop 2002
| Gaithersburg, MD 20899
| Email: nccoe@nist.gov

NATIONAL CYBERSECURITY CENTER OF EXCELLENCE
--------------------------------------------

The National Cybersecurity Center of Excellence (NCCoE), a part of the National Institute of Standards and Technology (NIST), is a collaborative hub where industry organizations, government agencies, and academic institutions work together to address businesses' most pressing cybersecurity issues. This public-private partnership enables the creation of practical cybersecurity solutions for specific industries, as well as for broad, cross-sector technology challenges. Through consortia under Cooperative Research and Development Agreements (CRADAs), including technology partners—from Fortune 50 market leaders to smaller companies specializing in information technology security—the NCCoE applies standards and best practices to develop modular, adaptable example cybersecurity solutions using commercially available technology. The NCCoE documents these example solutions in the NIST Special Publication 1800 series, which maps capabilities to the NIST Cybersecurity Framework and details the steps needed for another entity to re-create the example solution. The NCCoE was established in 2012 by NIST in partnership with the State of Maryland and Montgomery County, Maryland.

To learn more about the NCCoE, visit https://www.nccoe.nist.gov/. To learn more about NIST, visit https://www.nist.gov.


NIST CYBERSECURITY PRACTICE GUIDES
-----------------------------------

NIST Cybersecurity Practice Guides (Special Publication 1800 series) target specific cybersecurity challenges in the public and private sectors. They are practical, user-friendly guides that facilitate the adoption of standards-based approaches to cybersecurity. They show members of the information security community how to implement example solutions that help them align with relevant standards and best practices, and provide users with the materials lists, configuration files, and other information they need to implement a similar approach.

The documents in this series describe example implementations of cybersecurity practices that businesses and other organizations may voluntarily adopt. These documents do not describe regulations or mandatory practices, nor do they carry statutory authority.


Abstract
---------

The Cryptographic Module Validation Program (CMVP) validates third-party assertions that cryptographic module implementations satisfy the requirements of Federal Information Processing Standards (FIPS) Publication 140-3, Security Requirements for Cryptographic Modules. Historically, the CMVP validation review process has struggled to keep pace with the volume of cryptographic modules and accelerated software release cycles, contributing to delays in validation timelines. The NIST National Cybersecurity Center of Excellence (NCCoE) has undertaken the Automated Cryptographic Module Validation Project (ACMVP) to explore how automation can improve the efficiency and timeliness of CMVP operations and processes. The project demonstrates how structured test evidence, standardized submission protocols, and supporting modernized computing infrastructure can streamline the submission and review of validation artifacts. 

This publication describes the approaches and tools demonstrated by the ACMVP team. The publication describes the results of an ACMVP Test Evidence (TE) Workstream and Protocol Workstream, as demonstrated in a laboratory environment developed by the project's Research Infrastructure Workstream. The combined impact of these workstreams is intended to provide automation improvements to improve submission quality and enable a more efficient CMVP review process. 

Audience
----------

The primary audience for this report is technology, security, and privacy program managers, architects, software developers, engineers, and IT professionals involved with the CMVP, and accredited cryptography and security testing labs, and conformance offices at companies that produce security software and hardware.

Keywords
---------
Automated Cryptographic Module Validation Project (ACMVP); Cryptographic Module Validation Program (CMVP); cryptography; cryptographic module; cryptographic module testing; cryptographic module validation.

Collaborators
----------------------------------

Collaborators participating in this project submitted their capabilities in response to an open call in the Federal Register for all sources of relevant security capabilities from academia and industry (vendors and integrators). The following respondents with relevant capabilities or product components signed a Cooperative Research and Development Agreement (CRADA) to collaborate with NIST in a consortium to build this example solution.

-  Acumen Security

-  AEGISOLVE

-  Apple

-  atsec information security

-  AWS

-  Cisco

-  Katalyst

-  Lightship Security

-  Microsoft

-  NXP Semiconductors

-  SUSE

Certain commercial entities, equipment, products, or materials may be identified by name or company logo or other insignia in order to acknowledge their participation in this collaboration or to describe an experimental procedure or concept adequately. Such identification is not intended to imply special status or relationship with NIST or recommendation or endorsement by NIST or NCCoE and neither is it intended to imply that the entities, equipment, products, or materials are necessarily the best available for the purpose.

Acknowledgements
-----------------

Contributors to each workstream are listed in the corresponding sections below. Additionally, the following people and organizations contributed to the project outside of a workstream: Courtney Maatta, Rochelle Casey, Alicia Squires, Margaret Salter, Tim Ness, Damian Zell, Derrick Williams III, Jeff Wright, Mickey Iqbal, and David Browning of Amazon; Dave Hawes, Gavin O'Brien, Tim Hall, Matt Scholl, Cherilyn Pascoe, Jim St. Pierre, Kevin Stine, Ann Rickerds, Shawn Winhoven, Jeffrey J McIntyre, Anil Das, Edgar Garay, Jim Simmons, Robert Staples, Rob Densock, and Blair Heiserman of NIST; Jason Arnold of HII; William Barker of Strativia LLC; Karen Scarfone of Scarfone Cybersecurity; and Heather Flanagan of Spherical Cow Consulting.

The project team recognizes and appreciates Apostol Vassilev of NIST for leading the project at the inception and formulating the three workstreams and associated activities.

DOCUMENT CONVENTIONS 
----------------------

The terms “shall” and “shall not” indicate requirements to be followed strictly to conform to the publication and from which no deviation is permitted. The terms “should” and “should not” indicate that among several possibilities, one is recommended as particularly suitable without mentioning or excluding others, or that a certain course of action is preferred but not necessarily required, or that (in the negative form) a certain possibility or course of action is discouraged but not prohibited. The terms “may” and “may not” indicate a course of action permissible within the limits of the publication. The terms “can” and “cannot” indicate a possibility and capability, whether material, physical, or causal.

CALL FOR PATENT CLAIMS
-----------------------

This public review includes a call for information on essential patent claims (claims whose use would be required for compliance with the guidelines or requirements in this Information Technology Laboratory (ITL) draft publication). Such guidelines and/or requirements may be directly stated in this ITL Publication or by reference to another publication. This call also includes disclosure, where known, of the existence of pending U.S. or foreign patent applications relating to this ITL draft publication and of any relevant unexpired U.S. or foreign patents.

ITL may require from the patent holder, or a party authorized to make assurances on its behalf, in written or electronic form, either:

a) assurance in the form of a general disclaimer to the effect that such party does not hold and does not currently intend to hold any essential patent claim(s); or

b) assurance that a license to such essential patent claim(s) will be made available to applicants desiring to utilize the license for the purpose of complying with the guidelines or requirements in this ITL draft publication, either:

under reasonable terms and conditions that are demonstrably free of any unfair discrimination; or 

without compensation and under reasonable terms and conditions that are demonstrably free of any unfair discrimination. 

Such assurance shall indicate that the patent holder (or third party authorized to make assurances on its behalf) will include in any documents transferring ownership of patents subject to the assurance, provisions sufficient to ensure that the commitments in the assurance are binding on the transferee, and that the transferee will similarly include appropriate provisions in the event of future transfers with the goal of binding each successor-in-interest. 

The assurance shall also indicate that it is intended to be binding on successors-in-interest regardless of whether such provisions are included in the relevant transfer documents. 
Such statements should be addressed to: applied-crypto-testing@nist.gov 


.. toctree::
   :maxdepth: 3
   :titlesonly:
   :glob:
   :hidden:

   executive-summary.rst
   overview.rst
   approach.rst
   te-workstream.rst
   protocol-workstream.rst
   re-workstream.rst
   findings.rst
   references.rst
   appendix-a.rst
   te/tables/tetables.rst
   protocol/index.rst
   appendix-d.rst
   appendix-e/index.rst
