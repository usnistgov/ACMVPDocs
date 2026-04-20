Appendix E: Research Infrastructure
-----------------------------------------------------------------

.. toctree::
   :maxdepth: 3
   :titlesonly:
   :glob:
   :hidden:

   AWSAccountOrganization.rst
   AWSResearchCloudSystemArchitecture.rst
   IdentityandAccessManagement.rst
   AWSResearchCloudSecurity.rst
   AWSResearchCloudOperations.rst
   MappingtoNIST800Series.rst
   AutomationTemplates.rst

Introduction
============

The National Cybersecurity Center of Excellence (NCCoE) transitioned from an on-premises-only private cloud to a hybrid cloud, extending its presence into AWS. This document describes the design, architecture, configurations, and operational changes required to ensure continuous compliance with policy and security requirements.

NCCoE On-premises Private Cloud
===============================

The NCCoE on-premises private cloud is hosted on VMware, with Microsoft Active Directory serving as the authoritative identity source. While the NCCoE is embracing commercial clouds, the on-premises VMware cloud will remain a core service offering at the center. The addition of AWS will extend the NCCoE capabilities and service offerings.

NCCoE AWS Research Cloud
========================

The NCCoE AWS research cloud is built as an extension of the on-premises VMware cloud, subject to the same security policies, controls, compliance, and governance requirements. The AWS research cloud is connected to the on-premises VMware cloud by a Direct Connect via NOAA/NWAVE. The on-premises Active Directory (AD) is the authoritative identity source for the AWS research cloud environment.
