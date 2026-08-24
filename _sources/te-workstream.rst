Test Evidence Workstream 
===========================

.. toctree::
   :maxdepth: 3
   :titlesonly:
   :glob:
   :hidden:

   te-tables/te-table1
   te-tables/te-table2
   te-tables/te-table3
   te-tables/te-table4
   te-tables/te-table5
   te-tables/te-table6
   te-tables/te-table7
   te-tables/te-table8
   te-tables/te-table9
   te-tables/te-table10
   te-tables/tetables

The TE Workstream focused on how the individual requirements (known in ISO/IEC 24759 as Test Evidence) are classified by the lab and the validation authority. These TEs specify the requirements for information that are provided as supporting evidence to demonstrate cryptographic modules’ conformity to the requirements specified in ISO/IEC 19790:2012. The TE Workstream defined a structured application of test evidence (TE) classification and filtering, which is crucial in streamlining the validation process for cryptographic modules under FIPS 140-3. This structure enabled TE classification, filtering on relevant module submission requirements, and the development of an application to streamline the validation process of submitted cryptographic modules. 

TE Workstream Collaborators
-----------------------------

The ACMVP TE Workstream (WS) was led by Yi Mao of atsec information security and Shawn Geddis of Katalyst under the NCCoE ACMVP leadership of Murugiah Souppaya and Christopher Celi of NIST. The workstream is indebted to the invaluable contributions of Alex Calis of NIST CMVP, who served as the co-chair of this WS for more than two years. The WS benefited from contributions from the atsec information security team, including but not limited to Stephan Mueller, Walker Riley, Swapneela Unkule, and Jeremy Wesevich; the Intertek Acumen Security team led by James Reardon with Chris Bell, Sowndar Gillan Gopi, and Rutwij Kulkarni; the AEGISOLVE team including but not limited to Travis Spann, Javier Martel, Mike McCarl, and Debbie Harrington; Ryan Thomas of Lightship Security; Barry Fussell and Andrew Karcher of Cisco; Alicia Squires and Courtney Maatta of Amazon; Marc Ireland of NXP; Mike Grimm of Microsoft; Ivan Teblin and Blaine Stone of SUSE; and Michael Dimond of the MITRE Corporation.

The main accomplishments of the TE WS are as follows:

* Classification/categorization of TEs
* A well-defined structure for test evidence data represented in JSON 
* Alignment of the CMVP's Documentation TE List with TE classifications
* Recommended test methods for functional testing TEs
* TE filtering to make the report focus only on the relevant requirements

Test Evidence Classification
==============================

The TE WS has identified and sorted categories of test evidence required for CMVP validation that can readily be automated in a reporting format that is consistent with the current WebCryptik used by CMVP. The TE WS has also identified those test evidence classes for which manual processes are still needed.

TEs Requiring Vendor Documentation
------------------------------------

The TE WS team has classified test evidence into the following categories, depending on what needs to be checked, inspected, or tested, and how the vendor evidence (VE) is supposed to be provided:

1. Assessments based on reviewing the vendor documentation, especially the Security Policy

2. Assessments based on inspecting the module's source code

3. Assessments based on exercising/executing the module to cover:
    a. Functional testing
    b. Physical security

Item 3b is out of scope of this project but may be part of future work due to the nature of physical security tests. For example, the ability to remove a tamper-resistant sticker without evidence of tampering.

The required documentation for a FIPS validation is specified in the NIST SP 800-140A :ref:`[4] <ref-4>`, which modifies the vendor documentation requirements of ISO/IEC 19790 Annex A :ref:`[5] <ref-5>`. Hereafter, the vendor-documentation-dependent TEs will be indicated as 140A-TEs. Those TEs require the tester to verify the presence and accuracy of information within the vendor documentation or verify statements based on information from the documentation.

The 140A-TEs may or may not depend on the Security Policy. They may depend on source code or other proprietary documentation. So, the 140A-TEs can be further divided    into three sub-categories:

* **SP-TEs**: TEs depend on the information provided by the public-facing Security Policy. The NIST SP 800-140Br1 :ref:`[6] <ref-6>` is to be used in conjunction with ISO/IEC 19790 Annex B and ISO/IEC 24759 section 6.14. It also specifies the order of the Security Policy. Ideally, Special Publication 800-140Br1 should require Security Policy to include all information to satisfy the Security-Policy-dependent TEs.
* **SC-TEs**: TEs require source code review. It may not be intuitive that source code falls under vendor documentation. Source code review requires special care and attention. Therefore, we separate these SC-TEs from the TEs depending on other vendor documentation.
* **OD-TEs**: If a 140A-TE is not an SP-TE, nor an SC-TE, then we designate it as an OD-TE, meaning the TE depends on Other Documents such as Finite State Model (FSM), Component List (CL), design documents, user guidance, or configuration management manual. For each OD-TE, the lab is required to receive and verify specific documentation requirements. The CMVP only needs to receive assurance that the lab has completed each OD-TE task. 

The subsequent tables in this section are excerpts moved out of SP 1800-40B to be displayed here.
