**NIST SPECIAL PUBLICATION 1800-40B**

Automation of the NIST Cryptographic Module Validation Program
===============================================================

+---------------------------------------------+------------------------------+
| **Christopher Celi**                        | **Raoul Gabiam**             |
|                                             |                              |
| **Alex Calis**                              | **Kyle Vitale**              |
|                                             |                              |
| **Murugiah Souppaya**                       | *The MITRE Corporation*      |
|                                             |                              |
| *Computer Security Division*                |                              |
|                                             |                              |
| *NIST Information Technology Laboratory*    |                              |
+---------------------------------------------+------------------------------+
| **William Barker**                          | **Stephan Mueller**          |
|                                             |                              |
| *Domestic Guest Researcher*                 | **Yi Mao**                   |
|                                             |                              |
| *NIST Information Technology Laboratory*    | *atsec information security* |
+---------------------------------------------+------------------------------+
| **Karen Kent**                              | **Barry Fussell**            |
|                                             |                              |
| *Trusted Cyber Annex*                       | **Andrew Karcher**           |
|                                             |                              |
|                                             | *Cisco*                      |
+---------------------------------------------+------------------------------+
| **Shawn Geddis**                            | **Douglas Boldt**            |
|                                             |                              |
| *Katalyst*                                  | *Amazon Web Services*        |
+---------------------------------------------+------------------------------+


\*All work was done while at that organization.

Abstract
---------

The Cryptographic Module Validation Program (CMVP) validates third-party assertions that cryptographic module implementations satisfy the requirements of Federal Information Processing Standards (FIPS) Publication 140-3, Security Requirements for Cryptographic Modules. Historically, the CMVP validation review process has struggled to keep pace with the volume of cryptographic modules and accelerated software release cycles, contributing to delays in validation timelines. The NIST National Cybersecurity Center of Excellence (NCCoE) has undertaken the Automated Cryptographic Module Validation Project (ACMVP) to explore how automation can improve the efficiency and timeliness of CMVP operations and processes. The project demonstrates how structured test evidence, standardized submission protocols, and supporting modernized computing infrastructure can streamline the submission and review of validation artifacts. 

This publication describes the approaches and tools demonstrated by the ACMVP team through the results of the ACMVP Test Evidence (TE) Workstream, Protocol Workstream, and as demonstrated in a laboratory environment developed by the project's Research Infrastructure Workstream. The combined impact of these workstreams is intended to provide automation improvements to improve submission quality and enable a more efficient CMVP review process. 

Table of Contents
------------------

:doc:`Executive Summary </home/executivesummary>`

:doc:`Overview: Challenge and Solution Statements </home/overview>`

:doc:`Approach: How the Project Defined its Scope </home/approach>`

:doc:`Test Evidence Workstream: Work completed for the TE requirements </te-workstream>` 
    :doc:`Appendix B: TE Tables </te-tables/tetables>`

    :doc:`Area 2 Tables </te-tables/area2>`

    :doc:`Area 3 Tables </te-tables/area3>`

    :doc:`Area 4 Tables </te-tables/area4>`

    :doc:`Area 5 Tables </te-tables/area5>`

    :doc:`Area 6 Tables </te-tables/area6>`

    :doc:`Area 7 Tables </te-tables/area7>`

    :doc:`Area 8 Tables </te-tables/area8>`

    :doc:`Area 9 Tables </te-tables/area9>`

    :doc:`Area 10 Tables </te-tables/area10>`

    :doc:`Area 11 Tables </te-tables/area11>`

    :doc:`Area 12 Tables </te-tables/area12>`

    :doc:`Annex Tables </te-tables/annex>`

:doc:`Protocol Workstream: Work completed for the ACMVP demo server </protocol-workstream>` 
    :doc:`ACMVP Demo Server </protocol/index>`

:doc:`Research Infrastructure: Work completed for the Cloud Infrastructure </re-workstream>` 
    :doc:`Appendix D: Application Modernization </appendix-d>`
    
    :doc:`Appendix E: Research Infrastructure </appendix-e/index>`

:doc:`References </references>`

:doc:`Appendix A: List of Symbols, Abbreviations, and Acronyms and their Meanings </appendix-a>`


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

Acknowledgements
-----------------

Contributors to each workstream are listed in the corresponding sections below. Additionally, the following people and organizations contributed to the project outside of a workstream: Courtney Maatta, Rochelle Casey, Alicia Squires, Margaret Salter, Tim Ness, Damian Zell, Derrick Williams III, Jeff Wright, Mickey Iqbal, and David Browning of Amazon; Dave Hawes, Gavin O'Brien, Tim Hall, Matt Scholl, Cherilyn Pascoe, Jim St. Pierre, Kevin Stine, Ann Rickerds, Shawn Winhoven, Jeffrey J McIntyre, Anil Das, Edgar Garay, Jim Simmons, Robert Staples, Rob Densock, and Blair Heiserman of NIST; Jason Arnold of HII; William Barker of Strativia LLC; Karen Scarfone of Scarfone Cybersecurity; and Heather Flanagan of Spherical Cow Consulting.

The project team recognizes and appreciates Apostol Vassilev of NIST for leading the project at the inception and formulating the three workstreams and associated activities.



.. toctree::
   :maxdepth: 3
   :titlesonly:
   :glob:
   :hidden:

   home/executivesummary.rst
   home/overview.rst
   home/approach.rst
   te-workstream.rst
   protocol-workstream.rst
   re-workstream.rst
   references.rst
   appendix-a.rst