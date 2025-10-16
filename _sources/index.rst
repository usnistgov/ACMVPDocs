Automation of the NIST Cryptographic Module Validation Program
===============================================================

**April 2025 Status Report**

Initial Public Draft

+----------------------------------------+----------------------------+
| **Christopher Celi**                   | **Raoul Gabiam**           |
|                                        |                            |
| **Alex Calis**                         | The MITRE Corporation      |
|                                        |                            |
| **Murugiah Souppaya**                  | |                          |
|                                        |                            |
| Computer Security Division             | **Stephan Mueller**        |
|                                        |                            |
| Information Technology Laboratory      | **Yi Mao**                 |
|                                        |                            |
| |                                      | atsec information security |
|                                        |                            |
| **William Barker**                     | |                          |
|                                        |                            |
| Strativia LLC                          | **Barry Fussell**          |
|                                        |                            |
| |                                      | **Andrew Karcher**         |
|                                        |                            | 
| **Karen Scarfone**                     | Cisco                      |
|                                        |                            |
| Scarfone Cybersecurity                 | |                          |
|                                        |                            |
| |                                      | **Douglas Boldt**          |
|                                        |                            |
| **Shawn Geddis**                       | Amazon Web Services        |
|                                        |                            |
| Katalyst                               |                            |
|                                        |                            |
+----------------------------------------+----------------------------+

September 10, 2025

Abstract
---------

The Cryptographic Module Validation Program (CMVP) validates third-party assertions that cryptographic module implementations satisfy the requirements of Federal Information Processing Standards (FIPS) Publication 140-3, Security Requirements for Cryptographic Modules. The current cryptographic module validation process is heavily manual, out of sync with the speed of technology industry development and deployment. Thus, the NIST National Cybersecurity Center of Excellence (NCCoE) has undertaken the Automated Cryptographic Module Validation Project (ACMVP) to support improvement in the efficiency and timeliness of CMVP operations and processes. The goal is to demonstrate a suite of automated tools that have the potential to make the FIPS 140-3 validation process more efficient and provide higher assurances that test findings reported for modules meet FIPS 140-3 requirements. 

This report is the second status report for the project, which describes progress made between September 2024 and April 2025 and planned next steps. A prior update of work accomplished can be found in the `September 2024 status report <https://nvlpubs.nist.gov/nistpubs/CSWP/NIST.CSWP.37.ipd.pdf>`__. This document outlines progress across each of the three workstreams: the :ref:`Test Evidence (TE) Workstream <Test Evidence Workstream>`, the :ref:`Protocol Workstream <Protocol Workstream>`, and the :ref:`Research Infrastructure Workstream <Research Infrastructure Workstream>`, each a focused effort in its own right. The combined impact of these workstreams intends to result in improvements to the overall automation of the CMVP.

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

-  atsec

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

Contributors to each workstream are listed in the corresponding sections below. Additionally, the following people and organizations contributed to the project outside of a workstream: Courtney Maatta, Rochelle Casey, Alicia Squires, Margaret Salter, Tim Ness, Damian Zell, Derrick Williams III, Jeff Wright, Mickey Iqbal, and David Browning of Amazon; Dave Hawes, Gavin O’Brien, Tim Hall, Matt Scholl, Cherilyn Pascoe, Jim St. Pierre, Kevin Stine, Ann Rickerds, Shawn Winhoven, Jeffrey J McIntyre, Anil Das, Edgar Garay, Jim Simmons, Robert Staples, Rob Densock, and Blair Heiserman of NIST; Jason Arnold of HII; Heather Flanagan of Spherical Cow Consulting.

The project team recognizes and appreciates Apostol Vassilev of NIST for leading the project at the inception and kicking off the project and formulating the three workstreams and associated activities.

**NIST Technical Series Policies**

`Copyright, Use, and Licensing Statements <https://doi.org/10.6028/NIST-TECHPUBS.CROSSMARK-POLICY>`__

`NIST Technical Series Publication Identifier Syntax <https://www.nist.gov/nist-research-library/nist-technical-series-publications-author-instructions#pubid>`__

**How to Cite this NIST Technical Series Publication:**

Celi C, Souppaya M, Barker W, Scarfone K, Geddis S, Gabiam R, Mueller S, Mao Y, Fussell B, Karcher A, Boldt D (2025) Automation of the NIST Cryptographic Module Validation Program: April 2025 Status Report. (National Institute of Standards and Technology, Gaithersburg, MD), NIST Cybersecurity White Paper (CSWP) NIST CSWP 37B.ipd. https://doi.org/10.6028/NIST.CSWP.37b.ipd.

**Author ORCID iDs**

Chris Celi: 0000-0001-9979-6819

Alex Calis: 0000-0003-1937-8129

Murugiah Souppaya: 0000-0002-8055-8527

William Barker: 0000-0002-4113-8861

Karen Scarfone: 0000-0001-6334-9486

Raoul Gabiam: 0009-0000-7458-8028

**Public Comment Period**

September 10, 2025 - October 10, 2025

**Submit Comments**

applied-crypto-testing@nist.gov 

National Institute of Standards and Technology
Attn: Applied Cybersecurity Division, Information Technology Laboratory
100 Bureau Drive (Mail Stop 2000) Gaithersburg, MD 20899-2000

**Additional Information**

Additional information about this publication is available at https://csrc.nist.gov/publications/cswp, including related content, potential updates, and document history.

All comments are subject to release under the Freedom of Information Act (FOIA).

.. toctree::
   :maxdepth: 3
   :titlesonly:
   :glob:
   :hidden:

   overview.rst
   te/index.rst
   protocol/index.rst
   infrastructure/index.rst
   conclusion.rst
   references.rst
   te/tables/tetables.rst