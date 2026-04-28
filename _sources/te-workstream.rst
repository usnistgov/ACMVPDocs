Test Evidence Workstream 
===========================

The TE Workstream focused on how the individual requirements (known in ISO/IEC 24759 as Test Evidences) are classified by the lab and the validation authority. The TE Workstream defined a structured application of test evidence (TE) classification and filtering, which is crucial in streamlining the validation process for cryptographic modules under FIPS 140-3. This structure enabled TE classification, filtering on relevant module submission requirements, and the development of an application to streamline the validation process of submitted cryptographic modules. 

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
-----------------------------

The TE WS has identified and sorted categories of test evidence required for CMVP validation that can readily be automated in a reporting format that is consistent with the current WebCryptik used by CMVP. The TE WS has also identified those test evidence classes for which manual processes are still needed.

TEs Requiring Vendor Documentation
____________________________________

The TE WS team has classified test evidence into the following categories, depending on what needs to be checked, inspected, or tested, and how the vendor evidence (VE) is supposed to be provided:

1. Assessments based on reviewing the vendor documentation, especially the SP

2. Assessments based on inspecting the module's source code

3. Assessments based on exercising/executing the module to cover:
    a. Functional testing
    b. Physical security

The :ref:`Test Evidence Workstream` section of this document covers items 1 and 2. The :ref:`Protocol Workstream` covers item 3a. Item 3b is out of scope of this project but may be part of future work due to the nature of physical security tests. For example, the ability to remove a tamper-resistant sticker without evidence of tampering. 

The required documentation for a FIPS validation is specified in the NIST SP 800-140A :ref:`[4] <ref-4>`, which modifies the vendor documentation requirements of ISO/IEC 19790 Annex A :ref:`[5] <ref-5>`. Hereafter, the vendor-documentation-dependent TEs will be indicated as 140A-TEs. Those TEs require the tester to verify the presence and accuracy of information within the vendor documentation or verify statements based on information from the documentation.

The overall category of 140A-TEs, as opposed to the TEs depending on functional test (hereafter FT-TEs), is relatively clear. They are indicated by the keyword “verify” as in the following examples:

* “verify the name and version as indicated in AS04.13” (e.g., TE04.33.01)
* "verify the vendor documentation" (e.g., TE04.05.01)
* "verify that the vendor provided documentation" (e.g., TE05.05.01)
* "verify, by inspection and from the vendor documentation" (e.g., TE05.15.01)
* "verify the vendor documentation, and by inspection" (e.g., TE06.10.01), "verify by inspection, or from the vendor documentation" (e.g., TE07.15.01)
* "verify … as documented" (e.g., TE07.27.01)
* "verify … are documented" (e.g., TE07.33.01)
* "verify the vendor documentation shows … " (e.g., TE10.09.01)
* "verify … through the procedure documented in …" (e.g., TE10.11.01)

The 140A-TEs may or may not depend on the SP. They may depend on source code or other proprietary documentation. So, the 140A-TEs can be further divided    into three sub-categories:

* **SP-TEs**: TEs depend on the information provided by the public-facing Security Policy (SP). The NIST SP 800-140Br1 :ref:`[6] <ref-6>` is to be used in conjunction with ISO/IEC 19790 Annex B and ISO/IEC 24759 section 6.14. It also specifies the order of the SP. Ideally, Special Publication 800-140Br1 should require SP to include all information to satisfy the SP-dependent TEs.
* **SC-TEs**: TEs require source code review. It may not be intuitive that source code falls under vendor documentation. Source code review requires special care and attention. Therefore, we separate these SC-TEs from the TEs depending on other vendor documentation.
* **OD-TEs**: If a 140A-TE is not an SP-TE, nor an SC-TE, then we designate it as an OD-TE, meaning the TE depends on Other Documents such as Finite State Model (FSM), Component List (CL), design documents, user guidance, or configuration management manual. For each OD-TE, the lab is required to receive and verify specific documentation requirements. The CMVP only needs to receive assurance that the lab has completed each OD-TE task. 

Here are some examples:

* SP-TEs: 140B requires SP to provide the information
    * TE04.47.01: *The tester shall verify that the security functions used to authenticate operators are all approved security functions.*
    * TE04.48.01: *The tester shall verify that the authentication mechanism used to authenticate operators is an approved one.*
* SC-TEs: TEs that depend on source code inspection
    * TE03.07.05: *The tester shall verify that the vendor documentation specifies how the cryptographic module ensures that all data output via the data output interface is to be inhibited during error states or self-test conditions. The tester shall also verify, by inspection of the design of the cryptographic module, that the data output interface is, in fact, logically or physically inhibited under these conditions.*
    * TE03.15.05: *The tester shall examine the applicable source code(s) to ensure that the identified component is actually validating the documented format.*
* OD-TEs: requires a rationale of correctness, FSM, or SW/FW CL
    * TE03.19.03: *The tester shall verify the correctness of any rationale provided by the vendor. The burden of proof is on the vendor; if there is any uncertainty or ambiguity, the tester shall require the vendor to produce additional information as needed.* 
    * TE11.08.01: *The tester shall verify that the vendor has provided a description of the finite state model. This description shall contain the identification and description of all states of the module and a description of all corresponding state transitions. The tester shall verify that the descriptions of the state transitions include the internal module conditions, data inputs, and control inputs that cause transitions from one state to another, data outputs and status outputs resulting from transitions from one state to another.*
    * TE11.16.01: *The tester shall use the list supplied by the vendor to verify that a source listing for each software or firmware component is contained in the module.*

Let us look at an example TE that is assessed by reviewing the vendor documentation, and this TE's associated AS and VE.

**AS05.02** states, “The documentation requirements specified in {ISO/IEC 19790:2012} A.2.5 shall be provided.” Following that, VE05.02.01 states, “The vendor shall provide documentation as specified in ISO/IEC 19790:2012, A.2.5.” Lastly, the TE05.02.01 for this section states, “The tester shall verify completeness of the documentation specified in ISO/IEC 19790:2012, A.2.5.” :ref:`[6] <ref-6>`

To fulfill **TE05.02.01**, the tester needs to check the documentation provided by the vendor and verify that it is present and complete. The example illustrates a documentation-type TE (i.e., 140A-TE). TEs of this type are ripe for automation because they only rely on checking for the presence of appropriate texts. The accuracy of the information provided for these TEs is later verified by subsequent tests and documentation reviews done during Functional Testing, Source Code Review, and Module Inspection.

By exploring the relationship between VEs and TEs, it becomes apparent that if some VEs were in the form of a standardized SP, then their corresponding TEs can be verified through automation. The NIST CMVP worked hard on updating SP 800-140B and published its Revision 1 in November 2023. It specifies the expected content of the SP and provides an SP template for all vendors and labs to use. 

The current NIST WebCryptik Br1 v1.0.3 has built-in MIS Tables and search capability to look up and select CAVP certificates. The completed MIS (Module Information Structure) Tables can be saved as a JSON file and combined with other information in an SP Microsoft Word template to build the final SP. 

This TE WS explored an alternative method to generate the SP purely via JSON rather than implementing a hybrid approach that requires an SP Microsoft Word template to build the final SP. Following the CMVP's current SP Template v5.8, the NCCoE TE WS has developed an SP-evidence JSON file to satisfy all SP-TEs. The Protocol Workstream implemented the functionality on the ACMVP server, generating an SP based on the input SP-evidence JSON file. This functionality was demonstrated at the ICMC24.

Under the assumption that the SP strictly follows SP800-140Br1 :ref:`[6] <ref-6>` and the required SP content is captured in MIS Tables or the other data entries in the SP-evidence JSON file, all SP-TEs can reference the relevant data points in the SP-evidence JSON file. The existence of the reference can be automatically checked. If the reference exists, the corresponding TE passes. 

SP-TEs must be satisfied by the information provided by the SP as specified in NIST SP800-140Br1, which we denote as 140B-TEs. 140B-TEs is a subset of SP-TEs because a vendor may choose to include more information in the SP as required by the SP800-140Br1.

Furthermore, to maximize the automation, the 140A-TEs were classified under the mentioned types, where each type is captured by a standardized documentation-evidence JSON.

The following table lists all the TEs depending on the SP, regardless of whether the TE explicitly indicates the source of the vendor document to be SP or if SP800-140Br1 requires it, in column SP-TEs. The non-140B-but-140A-TEs column is intended not to duplicate the TEs from the SP-TEs column but to capture all other TEs that depend on vendor documentation, which could be SP, source code, FSM, Component List, design document, or other vendor proprietary documentation. Nevertheless, there are a few cases where the information needs to be in the SP and verified by (code) inspection or design document; the TEs (e.g., TE02.07.02) are listed under both columns, despite the duplication.

.. table:: Table 1 - Dividing 140A-TEs into non-140B-TEs and SP-TEs

   +---------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | **FIPS 140-3 Section Title**                            | **140A-TEs**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
   |                                                         +-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   |                                                         | **non-140B-but-140A-TEs**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | **SP-TEs**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
   +=========================================================+=============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+
   | General                                                 | None                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | None                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
   +---------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Cryptographic Module Specification                      | TE02.03.02, TE02.07.01, TE02.07.02 (also SP-TE), TE02.10.01 (also SP-TE), TE02.10.02, TE02.13.02, TE02.17.09,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | TE02.03.01, TE02.07.02, TE02.09.01, TE02.10.01, TE02.11.01, TE02.11.02, TE02.12.01, TE02.13.01, TE02.14.01, TE02.15.01, TE02.15.02, TE02.15.04, TE02.15.06, TE02.15.07, TE02.15.08, TE02.15.09, TE02.15.10, TE02.15.11, TE02.15.12, TE02.15.13, TE02.15.14, TE02.16.01, TE02.16.02, TE02.16.03, TE02.16.05, TE02.17.01, TE02.17.02, TE02.17.03, TE02.17.05, TE02.17.06, TE02.17.07, TE02.17.08, TE02.17.10, TE02.18.01, TE02.19.01, TE02.20.01, TE02.20.02, TE02.20.03, TE02.20.04, TE02.21.01, TE02.21.02, TE02.22.01, TE02.24.01, TE02.26.01, TE02.26.02, TE02.30.01 |
   +---------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Cryptographic Module Interfaces                         | TE03.01.02 (also SP-TE), TE03.02.01, TE03.05.02, TE03.06.02, TE03.07.01, TE03.07.03, TE03.07.05, TE03.07.06, TE03.07.07, TE03.08.02, TE03.09.01, TE03.10.01, TE03.10.03, TE03.10.05, TE03.11.02, TE03.13.01, TE03.14.01, TE03.14.02, TE03.14.03, TE03.15.01, TE03.15.02, TE03.15.05, TE03.16.01, TE03.18.01, TE03.19.01, TE03.19.03,                                                                                                                                                                                                                                                                        | TE03.01.01, TE03.01.02, TE03.01.03, TE03.02.02, TE03.03,01, TE03.04.01,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
   +---------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Roles, Services, and Authentication                     | TE04.02.01, TE04.03.01, TE04.07.01, TE04.07.02, TE04.19.01, TE04.20.01, TE04.20.02, TE04.21.01, TE04.22.01, TE04.25.01, TE04.33.01, TE04.35.01, TE04.38.01, TE04.39.01, TE04.42.01, TE04.42.02, TE04.43.01, TE04.44.01, TE04.45.01, TE04.51.02, TE04.53.01, TE04.54.01, TE04.55.01,                                                                                                                                                                                                                                                                                                                         | TE04.05.01, TE04.06.01, TE04.11.01, TE04.13.02, TE04.14.01, TE04.18.01, TE04.37.01, TE04.47.01, TE04.48.01, TE04.50.01, TE04.50.02, TE04.51.01, TE04.56.01, TE04.56.02, TE04.59.01                                                                                                                                                                                                                                                                                                                                                                                     |
   +---------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Software/Firmware Security                              | TE05.02.01, TE05.04.01, TE05.05.01, TE05.05.03, TE05.05.04, TE05.05.06, TE05.06.01, TE05.06.05, TE05.07.01, TE05.08.02, TE05.11.01, TE05.12.01, TE05.12.02, TE05.13.01, TE05.13.02, TE05.13.04, TE05.13.06, TE05.13.07, TE05.15.01, TE05.15.02, TE05.16.01, TE05.16.02, TE05.20.01, TE05.23.01                                                                                                                                                                                                                                                                                                              | TE05.05.02, TE05.17.01                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
   +---------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Operational Environment                                 | TE06.03.01, TE06.05.01, TE06.05.02, TE06.06.01, TE06.08.01, TE06.08.02, TE06.10.01, TE06.11.01, TE06.12.01, TE06.13.01, TE06.14.01, TE06.15.01, TE06.17.01, TE06.18.01, TE06.19.01, TE06.24.01, TE06.25.01, TE06.26.01, TE06.27.01, TE06.28.01,                                                                                                                                                                                                                                                                                                                                                             | TE06.07.01, TE06.09.01, TE06.20.01,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
   +---------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Physical Security                                       | TE07.10.01, TE07.11.01, TE07.12.01, TE07.15.01, TE07.15.02, TE07.19.01, TE07.20.01, TE07.25.01, TE07.26.01, TE07.32.01, TE07.33.01, TE07.35.01, TE07.37.01, TE07.37.02, TE07.39.01, TE07.39.02, TE07.39.03, TE07.39.04, TE07.41.01, TE07.42.01, TE07.43.01, TE07.44.01, TE07.45.01, TE07.46.01, TE07.47.01, TE07.48.01, TE07.50.01, TE07.50.02, TE07.50.03, TE07.51.01, TE07.51.02, TE07.51.03, TE07.51.04, TE07.51.05, TE07.51.07, TE07.53.01, TE07.55.01, TE07.57.01, TE07.60.01, TE07.65.01, TE07.65.02, TE07.65.03, TE07.65.04, TE07.65.05, TE07.65.06, TE07.65.07, TE07.67.01, TE07.71.01, TE07.73.01, | TE07.01.01, TE07.09.01, TE07.09.02, TE07.19.01, TE07.26.02, TE07.77.04, TE07.81.03                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
   +---------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Non-invasive Security                                   | Not yet enforced by the CMVP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | Not yet enforced by the CMVP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
   +---------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Sensitive Security Parameter Management                 | TE09.01.01, TE09.02.01, TE09.03.01, TE09.05.01, TE09.08.02, TE09.14.01, TE09.16.01, TE09.16.02, TE09.21.01, TE09.23.01, TE09.23.02, TE09.23.04, TE09.24.01, TE09.25.01, TE09.27.01, TE09.28.06, TE09.29.01, TE09.29.02, TE09.31.01, TE09.32.01, TE09.36.01                                                                                                                                                                                                                                                                                                                                                  | TE09.04.01, TE09.04.02, TE09.06.01, TE09.06.02, TE09.06.03, TE09.07.01, TE09.08.01, TE09.09.01, TE09.09.02, TE09.10.01, TE09.10.02, TE09.13.01, TE09.13.02, TE09.19.01, TE09.22.01, TE09.28.01, TE09.28.05, TE09.33.01, TE09.37.01                                                                                                                                                                                                                                                                                                                                     |
   +---------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Self-tests                                              | TE10.12.01, TE10.12.02, TE10.15.01, TE10.15.02, TE10.20.01, TE10.21.01, TE10.21.02, TE10.22.02, TE10.22.03, TE10.22.05, TE10.27.01, TE10.28.01, TE10.29.01, TE10.33.02, TE10.34.02, TE10.35.01, TE10.35.02, TE10.35.03, TE10.37.03, TE10.37.04, TE10.37.07, TE10.37.08, TE10.46.01, TE10.46.02, TE10.48.02, TE10.49.02, TE10.51.01, TE10.51.02, TE10.51.03                                                                                                                                                                                                                                                  | TE10.07.01, TE10.07.02, TE10.08.01, TE10.08.02, TE10.09.01, TE10.09.02, TE10.24.01, TE10.25.01, TE10.33.01, TE10.34.01, TE10.37.01, TE10.37.02, TE10.53.01                                                                                                                                                                                                                                                                                                                                                                                                             |
   +---------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Life-cycle Assurance                                    | TE11.01.01, TE11.03.01, TE11.04.01, TE11.04.02, TE11.04.03, TE11.04.04, TE11.05.01, TE11.06.01, TE11.08.01, TE11.08.02, TE11.08.03, TE11.08.04, TE11.08.05, TE11.08.07, TE11.08.08, TE11.08.10, TE11.08.11, TE11.08.12, TE11.13.01, TE11.15.01, TE11.15.02, TE11.16.01, TE11.17.01, TE11.18.01, TE11.19.01, TE11.21.01, TE11.23.01, TE11.24.01, TE11.25.01, TE11.26.01, TE11.28.01, TE11.28.02, TE11.28.03, TE11.29.01, TE11.29.02, TE11.30.01, TE11.31.01, TE11.33.01, TE11.34.01, TE11.38.03,                                                                                                             | TE11.32.01, TE11.35.01, TE11.36.01, TE11.37.01, TE11.38.01, TE11.39.01                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
   +---------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Mitigation of Other Attacks                             | TE12.01.01, TE12.04.02,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | TE12.02.01, TE12.04.01, TE12.04.03                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
   +---------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | NIST SP 800-140A                                        | TEA01.01                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
   +---------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | NIST SP 800-140B (Cryptographic module security policy) |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | TEB.01.01, TEB.02.01, TEB.03.01, TEB.03.02                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
   +---------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

TEs depending on Security Policy
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

See the SP-TEs column in **Table 1**.

TEs requiring source code inspection
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

TEs depending on source code review or inspection are a subset of the non-140B-but-140A-TEs column in **Table 1**. Some TEs have the explicit wording of “code” or “source code”, while others imply it via the phrase, “by inspection” or “inspecting the module.” TEs requiring source code review are tagged as SC-TE in :ref:`Appendix B: TE Tables`.

TEs depending on other documents
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

TEs requiring other documents are tagged as OD-TE in :ref:`A Complete list of TE Classification`.

TEs Requiring Module Functional Test
____________________________________

TEs in this category require the tester to exercise and manipulate the module to test its functionality. To do this, testers rely on various pieces of evidence that include logfile names, screenshots, or remote testing/video observation. In essence, the tester must directly see and interact with the module to ensure that it functions in the way specified by the vendor.

**TE09.03.02** is an example of this category. It states: “For each [Sensitive Security Parameter (SSP)] that can be entered, the tester shall first enter the SSP while assuming the correct entity. The tester shall then verify that entry is not possible when assuming an incorrect entity” :ref:`[3] <ref-3>`. To fulfill this TE, the tester must assume specific entities and use the module as those assumed roles, testing that the module correctly identifies roles and grants only the appropriate SSP entry service to each entity.

This category of TEs is the hardest to automate; however, we may address the work surrounding functional testing. Automation opportunities may be found in how the lab collects and prepares the test evidence (e.g., log files) from functional testing.

**Table 2** below lists all TEs that require Functional Testing.

.. table:: Table 2 TEs Requiring Functional Testing

   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------+
   | FIPS 140-3 Section Name             | TEs for SL 1-4                                                                                                                                                                                                                                                                                                                                                                                 | TEs for SL 2-4                                                                                                                                                                                                                                                                                                                                                                                                                                             | TEs for SL 3-4                                                                                                                                                                                                                                                                                             | TEs for SL 4                                                                                                |
   +=====================================+================================================================================================================================================================================================================================================================================================================================================================================================+============================================================================================================================================================================================================================================================================================================================================================================================================================================================+============================================================================================================================================================================================================================================================================================================+=============================================================================================================+
   | General                             | N/A                                                                                                                                                                                                                                                                                                                                                                                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                            |                                                                                                                                                                                                                                                                                                            |                                                                                                             |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------+
   | Module Specification                | TE02.10.01 (or SC-TE), TE02.12.01, TE02.13.03, TE02.15.03, TE02.15.05, TE02.16.04, TE02.17.02, TE02.17.04, TE02.19.02, TE02.22.02, TE02.24.02, TE02.26.03, TE02.26.04, TE02.26.05, TE02.28.01, TE02.28.02, TE02.30.02                                                                                                                                                                          | None                                                                                                                                                                                                                                                                                                                                                                                                                                                       | None                                                                                                                                                                                                                                                                                                       | None                                                                                                        |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------+
   | Module Interfaces                   | TE03.01.04, TE03.02.01, TE03.05.01, TE03.05.02, TE03.06.01, TE03.06.02, TE03.07.02, TE03.07.04, TE03.07.08, TE03.08.01, TE03.08.02, TE03.09.02, TE03.10.02, TE03.10.04, TE03.11.01, TE03.11.03, TE03.13.02, TE03.14.03, TE03.15.02, TE03.15.03, TE03.15.04, TE03.15.06,                                                                                                                        | None                                                                                                                                                                                                                                                                                                                                                                                                                                                       | TE03.16.01 (or SC-TE), TE03.18.01, TE03.18.02, TE03.19.02, TE03.19.04, TE03.20.01, TE03.21.01,                                                                                                                                                                                                             | TE03.22.01                                                                                                  |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------+
   | Roles, Services, and Authentication | TE04.02.02, TE04.02.03, TE04.07.03, TE04.11.02, TE04.13.01, TE04.13.03, TE04.14.02, TE04.15.01, TE04.18.01, TE04.19.02, TE04.19.03, TE04.20.01, TE04.20.03, TE04.21.02, TE04.22.02, TE04.23.01, TE04.25.02, TE04.25.03, TE04.28.01, TE04.29.01, TE04.32.01, TE04.33.01, TE04.34.01, TE04.35.02, TE04.43.02, TE04.44.02, TE04.56.02 (L1 only)                                                   | | TE04.37.02, TE04.38.02,                                                                                                                                                                                                                                                                                                                                                                                                                                  | TE04.39.02, TE04.39.03, TE04.39.04, TE04.42.03, TE04.42.04,                                                                                                                                                                                                                                                | TE04.59.01                                                                                                  |
   |                                     |                                                                                                                                                                                                                                                                                                                                                                                                | | TE04.45.02, TE04.45.03, TE04.52.01, TE04.53.01                                                                                                                                                                                                                                                                                                                                                                                                           |                                                                                                                                                                                                                                                                                                            |                                                                                                             |
   |                                     |                                                                                                                                                                                                                                                                                                                                                                                                | | (L2 only)                                                                                                                                                                                                                                                                                                                                                                                                                                                |                                                                                                                                                                                                                                                                                                            |                                                                                                             |
   |                                     |                                                                                                                                                                                                                                                                                                                                                                                                |                                                                                                                                                                                                                                                                                                                                                                                                                                                            |                                                                                                                                                                                                                                                                                                            |                                                                                                             |
   |                                     |                                                                                                                                                                                                                                                                                                                                                                                                | TE04.54.02, TE04.54.03, TE04.55.02                                                                                                                                                                                                                                                                                                                                                                                                                         |                                                                                                                                                                                                                                                                                                            |                                                                                                             |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------+
   | Software/Firmware Security          | TE05.05.05, TE05.05.07, TE05.06.02, TE05.06.03, TE05.06.04, TE05.06.06, TE05.07.01, TE05.08.01, TE05.08.02, TE05.11.01, TE05.11.02, TE05.12.02, TE05.13.01, TE05.13.02, TE05.13.03, TE05.13.04, TE05.13.05, TE05.13.06, TE05.13.08,                                                                                                                                                            | TE05.15.01, TE05.15.02, TE05.16.03, TE05.17.02                                                                                                                                                                                                                                                                                                                                                                                                             | TE05.20.01, TE05.23.01                                                                                                                                                                                                                                                                                     | none                                                                                                        |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------+
   | Operational Environment             | TE06.05.01, TE06.05.02, TE06.05.03, TE06.06.01, TE06.06.02, TE06.08.01, TE06.08.02, TE06.08.03,                                                                                                                                                                                                                                                                                                | The following TEs are for L2 only:                                                                                                                                                                                                                                                                                                                                                                                                                         | None                                                                                                                                                                                                                                                                                                       | None                                                                                                        |
   |                                     |                                                                                                                                                                                                                                                                                                                                                                                                | TE06.09.02, TE06.09.03, TE06.10.01, TE06.10.02, TE06.10.03, TE06.11.01, TE06.11.02, TE06.11.03, TE06.12.01, TE06.12.02, TE06.12.03, TE06.13.01, TE06.13.02, TE06.13.03, TE06.14.01, TE06.14.02, TE06.14.03, TE06.15.01, TE06.15.02, TE06.15.03, TE06.17.01, TE06.17.02, TE06.17.03, TE06.18.01, TE06.18.02, TE06.18.03, TE06.24.01, TE06.25.01, TE06.25.02, TE06.26.01, TE06.26.02, TE06.27.01, TE06.27.02, TE06.28.01, TE06.28.02, TE06.28.03, TE06.28.04 |                                                                                                                                                                                                                                                                                                            |                                                                                                             |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------+
   | Physical Security                   | TE07.01.02, TE07.10.02, TE07.11.02, TE07.13.01, TE07.15.01, TE07.37.01, TE07.43.01, TE07.60.01,                                                                                                                                                                                                                                                                                                | TE07.19.01, TE07.20.01, TE07.35.01, TE07.44.01, TE07.45.01, TE07.45.02, TE07.46.01, TE07.47.01, TE07.47.02, TE07.48.01, TE07.48.02, TE07.62.01, TE07.63.01,                                                                                                                                                                                                                                                                                                | TE07.25.01, TE07.26.01, TE07.27.01, TE07.37.03, TE07.39.03, TE07.39.04, TE07.39.05, TE07.39.06, TE07.50.02, TE07.50.03, TE07.51.04, TE07.51.05, TE07.51.06, TE07.51.08, TE07.51.09, TE07.65.04, TE07.65.05, TE07.65.06, TE07.65.08, TE07.65.09, TE07.77.01, TE07.77.02, TE07.77.03, TE07.81.01, TE07.81.02 | TE07.32.01, TE07.41.01, TE07.41.02, TE07.42.02, TE07.53.01, TE07.55.01, TE07.58.01, TE07.67.01, TE07.71.02, |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------+
   | Non-Invasive Security               | N/A                                                                                                                                                                                                                                                                                                                                                                                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                            |                                                                                                                                                                                                                                                                                                            |                                                                                                             |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------+
   | SSP Management                      | TE09.01.02, TE09.01.03, TE09.02.02, TE09.03.02, TE09.03.03, TE09.13.03, TE09.14.02, TE09.16.03, TE09.18.01, TE09.18.02, TE09.21.02, TE09.21.03, TE09.21.04, TE09.22.01, TE09.24.02, TE09.25.02, TE09.27.02, TE09.28.02, TE09.28.03, TE09.28.04, TE09.33.02, TE09.36.02, TE09.37.02                                                                                                             | None                                                                                                                                                                                                                                                                                                                                                                                                                                                       | None                                                                                                                                                                                                                                                                                                       | None                                                                                                        |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------+
   | Self-Tests                          | TE10.07.03, TE10.07.04, TE10.07.05, TE10.08.03, TE10.09.03, TE10.10.01, TE10.10.02, TE10.11.01, TE10.15.01, TE10.15.02, TE10.21.01, TE10.21.02, TE10.21.03, TE10.21.04, TE10.22.01, TE10.22.04, TE10.25.02, TE10.27.01, TE10.28.02, TE10.34.03, TE10.35.04, TE10.37.05, TE10.37.06, TE10.37.09, TE10.46.03, TE10.46.04, TE10.48.01, TE10.48.03, TE10.49.01, TE10.49.03, TE10.53.02, TE10.53.03 |                                                                                                                                                                                                                                                                                                                                                                                                                                                            | TE10.12.03, TE10.12.04, TE10.12.05, TE10.54.01                                                                                                                                                                                                                                                             |                                                                                                             |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------+
   | Life-Cycle Assurance                | TE11.08.06, TE11.08.09, TE11.11.01, TE11.13.02, TE11.32.02                                                                                                                                                                                                                                                                                                                                     |                                                                                                                                                                                                                                                                                                                                                                                                                                                            |                                                                                                                                                                                                                                                                                                            | TE11.28.02, TE11.28.03,TE11.28.04                                                                           |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------+
   | Mitigation of Other Attacks         | N/A                                                                                                                                                                                                                                                                                                                                                                                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                            |                                                                                                                                                                                                                                                                                                            |                                                                                                             |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------+

A Complete list of TE Classification
____________________________________

All TEs are classified into four categories (i.e., SP-TE, OD-TE, SC-TC, FT-TE) and their potential combination.

The complete set of the TE classification tags is listed below:

- SP-TE: TEs depending on the SP

- SC-TE: TEs depending on source code review or inspection

- OD-TE: TEs depending on other vendor documentation

- FT-TE: TEs depending on functional testing evidence

- SC-TE/OD-TE: TEs depend on vendor documentation, regardless of whether it is source code *or* not

- FT-TE/OD-TE: TEs depend on vendor documentation, regardless of whether it is functional testing evidence *or* not

- SC-TE/SP-TE: TEs depending on source code review *or* on the SP

- SP-TE, FT-TE: TE depending on the SP *and* on functional testing

- SC-TE, FT-TE: TE depending on source code review *and* on functional testing

Greyed out TEs are those not currently required by the CMVP.

The OD-TEs depend on proprietary vendor documentation. Therefore, they do not belong to the SP-TE category.

Examples:

- FT-TE:

  - The tester shall verify, by exercising the module, that the status indicator is provided when the trusted channel is in use. (e.g., TE03.21.01)

  - The tester shall verify that an identity-based authentication mechanism is employed for all services utilizing the trusted channel. (e.g., TE03.20.01)

- SP-TE, FT-TE or FT-TE, OD-TE:

  - “The tester shall use the vendor documentation to access multi-factor identity-based authentication.” (e.g., TE04.59.01)

  - The tester shall verify from the vendor documentation and by inspection that the approved authentication mechanism implemented in the operating system meets the applicable requirements. (TE04.53.01)

- SP-TE, FT-TE or FT-TE, OD-TE:

  - “The tester shall invoke the approved mode of operation using the vendor-provided instructions found in the non-proprietary security policy” (e.g., TE02.19.02)

  - “The tester shall verify that the module implements a bypass capability as specified in the vendor documentation” (e.g., TE04.18.01)

  - “The tester shall attempt to perform cryptographic operations using each of the SSPs that were stored in the module.” (e.g., TE04.35.02)

  - “The tester shall perform the following tests.” (e.g., TE04.38.02)

  - “The tester shall exercise the cryptographic module” (e.g., TE04.42.04)


.. table:: Table 3 Legend of TE Tags

   +---------------------------------------------------------+-------------------------------------------------------------+
   | SP-TE: SP-dependent TE                                  | FT-TE/OD-TE: Functional-Test- or documentation-dependent TE |
   +=========================================================+=============================================================+
   | SC-TE: Source-Code-dependent TE                         | SC-TE/SP-TE: Source-Code- or SP-dependent TE                |
   +---------------------------------------------------------+-------------------------------------------------------------+
   | OD-TE: Other-Document-dependent TE                      | SP-TE, FT-TE: SP- and Functional Test-dependent TE          |
   +---------------------------------------------------------+-------------------------------------------------------------+
   | FT-TE: Functional-Test-dependent TE                     | SC-TE, FT-TE: Source-Code- and Functional-Test-dependent TE |
   +---------------------------------------------------------+-------------------------------------------------------------+
   | SC-TE/OD-TE: Source-Code- or documentation-dependent TE |                                                             |
   +---------------------------------------------------------+-------------------------------------------------------------+

+------------+--------------------------+
| TE02.03.01 | SP-TE                    |
+============+==========================+
| TE02.03.02 | OD-TE                    |
+------------+--------------------------+
| TE02.07.01 | SC-TE, SP-TE             |
+------------+--------------------------+
| TE02.07.02 | SC-TE, SP-TE             |
+------------+--------------------------+
| TE02.09.01 | SP-TE                    |
+------------+--------------------------+
| TE02.10.01 | SP-TE, SC-TE/FT-TE       |
+------------+--------------------------+
| TE02.10.02 | OD-TE                    |
+------------+--------------------------+
| TE02.11.01 | SP-TE                    |
+------------+--------------------------+
| TE02.11.02 | SP-TE                    |
+------------+--------------------------+
| TE02.12.01 | SP-TE, FT-TE             |
+------------+--------------------------+
| TE02.13.01 | SP-TE                    |
+------------+--------------------------+
| TE02.13.02 | OD-TE                    |
+------------+--------------------------+
| TE02.13.03 | FT-TE                    |
+------------+--------------------------+
| TE02.14.01 | SP-TE                    |
+------------+--------------------------+
| TE02.15.01 | SP-TE                    |
+------------+--------------------------+
| TE02.15.02 | SP-TE                    |
+------------+--------------------------+
| TE02.15.03 | FT-TE                    |
+------------+--------------------------+
| TE02.15.04 | SP-TE                    |
+------------+--------------------------+
| TE02.15.05 | FT-TE                    |
+------------+--------------------------+
| TE02.15.06 | SP-TE                    |
+------------+--------------------------+
| TE02.15.07 | SP-TE                    |
+------------+--------------------------+
| TE02.15.08 | SP-TE                    |
+------------+--------------------------+
| TE02.15.09 | SP-TE                    |
+------------+--------------------------+
| TE02.15.10 | SP-TE                    |
+------------+--------------------------+
| TE02.15.11 | SP-TE                    |
+------------+--------------------------+
| TE02.15.12 | SP-TE                    |
+------------+--------------------------+
| TE02.15.13 | SP-TE                    |
+------------+--------------------------+
| TE02.15.14 | SP-TE                    |
+------------+--------------------------+
| TE02.16.01 | SP-TE                    |
+------------+--------------------------+
| TE02.16.02 | SP-TE                    |
+------------+--------------------------+
| TE02.16.03 | SP-TE                    |
+------------+--------------------------+
| TE02.16.04 | FT-TE                    |
+------------+--------------------------+
| TE02.16.05 | SP-TE                    |
+------------+--------------------------+
| TE02.17.01 | SP-TE                    |
+------------+--------------------------+
| TE02.17.02 | SP-TE, FT-TE             |
+------------+--------------------------+
| TE02.17.03 | SP-TE                    |
+------------+--------------------------+
| TE02.17.04 | FT-TE                    |
+------------+--------------------------+
| TE02.17.05 | SP-TE                    |
+------------+--------------------------+
| TE02.17.06 | SP-TE                    |
+------------+--------------------------+
| TE02.17.07 | SP-TE                    |
+------------+--------------------------+
| TE02.17.08 | SP-TE                    |
+------------+--------------------------+
| TE02.17.09 | OD-TE                    |
+------------+--------------------------+
| TE02.17.10 | SP-TE                    |
+------------+--------------------------+
| TE02.18.01 | SP-TE                    |
+------------+--------------------------+
| TE02.19.01 | SP-TE                    |
+------------+--------------------------+
| TE02.19.02 | FT-TE                    |
+------------+--------------------------+
| TE02.20.01 | SP-TE                    |
+------------+--------------------------+
| TE02.20.02 | SP-TE                    |
+------------+--------------------------+
| TE02.20.03 | SP-TE                    |
+------------+--------------------------+
| TE02.20.04 | SP-TE                    |
+------------+--------------------------+
| TE02.21.01 | SP-TE                    |
+------------+--------------------------+
| TE02.21.02 | SP-TE                    |
+------------+--------------------------+
| TE02.22.01 | SP-TE                    |
+------------+--------------------------+
| TE02.22.02 | FT-TE                    |
+------------+--------------------------+
| TE02.24.01 | SP-TE                    |
+------------+--------------------------+
| TE02.24.02 | FT-TE                    |
+------------+--------------------------+
| TE02.26.01 | SP-TE                    |
+------------+--------------------------+
| TE02.26.02 | SP-TE                    |
+------------+--------------------------+
| TE02.26.03 | FT-TE                    |
+------------+--------------------------+
| TE02.26.04 | FT-TE                    |
+------------+--------------------------+
| TE02.26.05 | FT-TE                    |
+------------+--------------------------+
| TE02.28.01 | FT-TE                    |
+------------+--------------------------+
| TE02.28.02 | FT-TE                    |
+------------+--------------------------+
| TE02.30.01 | SP-TE                    |
+------------+--------------------------+
| TE02.30.02 | FT-TE                    |
+------------+--------------------------+
| TE03.01.01 | SP-TE                    |
+------------+--------------------------+
| TE03.01.02 | SP-TE, SC-TE             |
+------------+--------------------------+
| TE03.01.03 | SP-TE                    |
+------------+--------------------------+
| TE03.01.04 | FT-TE                    |
+------------+--------------------------+
| TE03.02.01 | SC-TE, FT-TE             |
+------------+--------------------------+
| TE03.02.02 | SP-TE                    |
+------------+--------------------------+
| TE03.03.01 | SP-TE                    |
+------------+--------------------------+
| TE03.04.01 | SP-TE                    |
+------------+--------------------------+
| TE03.05.01 | FT-TE                    |
+------------+--------------------------+
| TE03.05.02 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE03.06.01 | FT-TE                    |
+------------+--------------------------+
| TE03.06.02 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE03.07.01 | OD-TE                    |
+------------+--------------------------+
| TE03.07.02 | FT-TE                    |
+------------+--------------------------+
| TE03.07.03 | OD-TE                    |
+------------+--------------------------+
| TE03.07.04 | FT-TE                    |
+------------+--------------------------+
| TE03.07.05 | OD-TE, SC-TE             |
+------------+--------------------------+
| TE03.07.06 | OD-TE                    |
+------------+--------------------------+
| TE03.07.07 | OD-TE                    |
+------------+--------------------------+
| TE03.07.08 | FT-TE                    |
+------------+--------------------------+
| TE03.08.01 | FT-TE                    |
+------------+--------------------------+
| TE03.08.02 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE03.09.01 | OD-TE                    |
+------------+--------------------------+
| TE03.09.02 | FT-TE                    |
+------------+--------------------------+
| TE03.10.01 | OD-TE                    |
+------------+--------------------------+
| TE03.10.02 | FT-TE                    |
+------------+--------------------------+
| TE03.10.03 | OD-TE                    |
+------------+--------------------------+
| TE03.10.04 | FT-TE                    |
+------------+--------------------------+
| TE03.10.05 | SC-TE/OD-TE              |
+------------+--------------------------+
| TE03.11.01 | FT-TE                    |
+------------+--------------------------+
| TE03.11.02 | OD-TE                    |
+------------+--------------------------+
| TE03.11.03 | FT-TE                    |
+------------+--------------------------+
| TE03.13.01 | OD-TE                    |
+------------+--------------------------+
| TE03.13.02 | FT-TE                    |
+------------+--------------------------+
| TE03.14.01 | SC-TE/OD-TE              |
+------------+--------------------------+
| TE03.14.02 | SC-TE/OD-TE              |
+------------+--------------------------+
| TE03.14.03 | FT-TE, SC-TE             |
+------------+--------------------------+
| TE03.15.01 | OD-TE                    |
+------------+--------------------------+
| TE03.15.02 | FT-TE, SC-TE             |
+------------+--------------------------+
| TE03.15.03 | FT-TE                    |
+------------+--------------------------+
| TE03.15.04 | FT-TE                    |
+------------+--------------------------+
| TE03.15.05 | SC-TE                    |
+------------+--------------------------+
| TE03.15.06 | FT-TE                    |
+------------+--------------------------+
| TE03.16.01 | OD-TE, SC-TE/FT-TE       |
+------------+--------------------------+
| TE03.18.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE03.18.02 | FT-TE                    |
+------------+--------------------------+
| TE03.19.01 | OD-TE, SC-TE             |
+------------+--------------------------+
| TE03.19.02 | FT-TE                    |
+------------+--------------------------+
| TE03.19.03 | OD-TE                    |
+------------+--------------------------+
| TE03.19.04 | FT-TE                    |
+------------+--------------------------+
| TE03.20.01 | FT-TE                    |
+------------+--------------------------+
| TE03.21.01 | FT-TE                    |
+------------+--------------------------+
| TE03.22.01 | FT-TE                    |
+------------+--------------------------+
| TE04.02.01 | OD-TE                    |
+------------+--------------------------+
| TE04.02.02 | FT-TE                    |
+------------+--------------------------+
| TE04.02.03 | FT-TE                    |
+------------+--------------------------+
| TE04.03.01 | OD-TE                    |
+------------+--------------------------+
| TE04.05.01 | SP-TE                    |
+------------+--------------------------+
| TE04.06.01 | SP-TE                    |
+------------+--------------------------+
| TE04.07.01 | OD-TE                    |
+------------+--------------------------+
| TE04.07.02 | OD-TE                    |
+------------+--------------------------+
| TE04.07.03 | FT-TE                    |
+------------+--------------------------+
| TE04.11.01 | SP-TE                    |
+------------+--------------------------+
| TE04.11.02 | FT-TE                    |
+------------+--------------------------+
| TE04.13.01 | FT-TE                    |
+------------+--------------------------+
| TE04.13.02 | SP-TE                    |
+------------+--------------------------+
| TE04.13.03 | FT-TE, [STRIKEOUT:OD-TE] |
+------------+--------------------------+
| TE04.14.01 | SP-TE                    |
+------------+--------------------------+
| TE04.14.02 | FT-TE                    |
+------------+--------------------------+
| TE04.15.01 | FT-TE                    |
+------------+--------------------------+
| TE04.18.01 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE04.19.01 | OD-TE                    |
+------------+--------------------------+
| TE04.19.02 | FT-TE                    |
+------------+--------------------------+
| TE04.19.03 | FT-TE                    |
+------------+--------------------------+
| TE04.20.01 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE04.20.02 | OD-TE                    |
+------------+--------------------------+
| TE04.20.03 | FT-TE                    |
+------------+--------------------------+
| TE04.21.01 | OD-TE                    |
+------------+--------------------------+
| TE04.21.02 | FT-TE                    |
+------------+--------------------------+
| TE04.22.01 | OD-TE                    |
+------------+--------------------------+
| TE04.22.02 | FT-TE                    |
+------------+--------------------------+
| TE04.23.01 | FT-TE                    |
+------------+--------------------------+
| TE04.25.01 | OD-TE                    |
+------------+--------------------------+
| TE04.25.02 | FT-TE                    |
+------------+--------------------------+
| TE04.25.03 | FT-TE                    |
+------------+--------------------------+
| TE04.28.01 | FT-TE                    |
+------------+--------------------------+
| TE04.29.01 | FT-TE                    |
+------------+--------------------------+
| TE04.32.01 | FT-TE                    |
+------------+--------------------------+
| TE04.33.01 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE04.34.01 | FT-TE                    |
+------------+--------------------------+
| TE04.35.01 | OD-TE                    |
+------------+--------------------------+
| TE04.35.02 | FT-TE                    |
+------------+--------------------------+
| TE04.37.01 | SP-TE                    |
+------------+--------------------------+
| TE04.37.02 | FT-TE                    |
+------------+--------------------------+
| TE04.38.01 | OD-TE                    |
+------------+--------------------------+
| TE04.38.02 | FT-TE                    |
+------------+--------------------------+
| TE04.39.01 | OD-TE                    |
+------------+--------------------------+
| TE04.39.02 | FT-TE                    |
+------------+--------------------------+
| TE04.39.03 | FT-TE                    |
+------------+--------------------------+
| TE04.39.04 | FT-TE                    |
+------------+--------------------------+
| TE04.42.01 | OD-TE                    |
+------------+--------------------------+
| TE04.42.02 | OD-TE                    |
+------------+--------------------------+
| TE04.42.03 | FT-TE                    |
+------------+--------------------------+
| TE04.42.04 | FT-TE                    |
+------------+--------------------------+
| TE04.43.01 | OD-TE                    |
+------------+--------------------------+
| TE04.43.02 | FT-TE                    |
+------------+--------------------------+
| TE04.44.01 | OD-TE                    |
+------------+--------------------------+
| TE04.44.02 | FT-TE                    |
+------------+--------------------------+
| TE04.45.01 | OD-TE                    |
+------------+--------------------------+
| TE04.45.02 | FT-TE                    |
+------------+--------------------------+
| TE04.45.03 | FT-TE                    |
+------------+--------------------------+
| TE04.47.01 | SP-TE                    |
+------------+--------------------------+
| TE04.48.01 | SP-TE                    |
+------------+--------------------------+
| TE04.50.01 | SP-TE                    |
+------------+--------------------------+
| TE04.50.02 | SP-TE                    |
+------------+--------------------------+
| TE04.51.01 | SP-TE                    |
+------------+--------------------------+
| TE04.51.02 | SP-TE                    |
+------------+--------------------------+
| TE04.52.01 | OD-TE,                   |
|            |                          |
|            | FT-TE                    |
+------------+--------------------------+
| TE04.53.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE04.54.01 | OD-TE                    |
+------------+--------------------------+
| TE04.54.02 | FT-TE                    |
+------------+--------------------------+
| TE04.54.03 | FT-TE                    |
+------------+--------------------------+
| TE04.55.01 | OD-TE                    |
+------------+--------------------------+
| TE04.55.02 | FT-TE                    |
+------------+--------------------------+
| TE04.56.01 | SP-TE                    |
+------------+--------------------------+
| TE04.56.02 | FT-TE                    |
+------------+--------------------------+
| TE04.59.01 | SP-TE, FT-TE             |
+------------+--------------------------+
| TE05.02.01 | OD-TE                    |
+------------+--------------------------+
| TE05.04.01 | SC-TE                    |
+------------+--------------------------+
| TE05.05.01 | SC-TE                    |
+------------+--------------------------+
| TE05.05.02 | SP-TE                    |
+------------+--------------------------+
| TE05.05.03 | OD-TE                    |
+------------+--------------------------+
| TE05.05.04 | OD-TE                    |
+------------+--------------------------+
| TE05.05.05 | FT-TE                    |
+------------+--------------------------+
| TE05.05.06 | SC-TE/OD-TE              |
+------------+--------------------------+
| TE05.05.07 | FT-TE                    |
+------------+--------------------------+
| TE05.06.01 | SC-TE                    |
+------------+--------------------------+
| TE05.06.02 | FT-TE                    |
+------------+--------------------------+
| TE05.06.03 | FT-TE                    |
+------------+--------------------------+
| TE05.06.04 | FT-TE                    |
+------------+--------------------------+
| TE05.06.05 | SC-TE                    |
+------------+--------------------------+
| TE05.06.06 | FT-TE                    |
+------------+--------------------------+
| TE05.07.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE05.08.01 | FT-TE                    |
+------------+--------------------------+
| TE05.08.02 | FT-TE, SC-TE             |
+------------+--------------------------+
| TE05.11.01 | FT-TE                    |
+------------+--------------------------+
| TE05.11.02 | FT-TE                    |
+------------+--------------------------+
| TE05.12.01 | OD-TE                    |
+------------+--------------------------+
| TE05.12.02 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE05.13.01 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE05.13.02 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE05.13.03 | FT-TE                    |
+------------+--------------------------+
| TE05.13.04 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE05.13.05 | FT-TE                    |
+------------+--------------------------+
| TE05.13.06 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE05.13.07 | SC-TE/OD-TE              |
+------------+--------------------------+
| TE05.13.08 | FT-TE                    |
+------------+--------------------------+
| TE05.15.01 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE05.15.02 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE05.16.01 | OD-TE                    |
+------------+--------------------------+
| TE05.16.02 | OD-TE                    |
+------------+--------------------------+
| TE05.16.03 | FT-TE                    |
+------------+--------------------------+
| TE05.17.01 | SP-TE                    |
+------------+--------------------------+
| TE05.17.02 | FT-TE                    |
+------------+--------------------------+
| TE05.20.01 | SC-TE, FT-TE             |
+------------+--------------------------+
| TE05.23.01 | FT-TE/OD-TE              |
+------------+--------------------------+
| TE06.03.01 | OD-TE                    |
+------------+--------------------------+
| TE06.05.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE06.05.02 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE06.05.03 | FT-TE                    |
+------------+--------------------------+
| TE06.06.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE06.06.02 | FT-TE                    |
+------------+--------------------------+
| TE06.07.01 | SP-TE                    |
+------------+--------------------------+
| TE06.08.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE06.08.02 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE06.08.03 | FT-TE                    |
+------------+--------------------------+
| TE06.09.01 | SP-TE                    |
+------------+--------------------------+
| TE06.09.02 | FT-TE                    |
+------------+--------------------------+
| TE06.09.03 | FT-TE                    |
+------------+--------------------------+
| TE06.10.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE06.10.02 | FT-TE                    |
+------------+--------------------------+
| TE06.10.03 | FT-TE                    |
+------------+--------------------------+
| TE06.11.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE06.11.02 | FT-TE                    |
+------------+--------------------------+
| TE06.11.03 | FT-TE                    |
+------------+--------------------------+
| TE06.12.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE06.12.02 | FT-TE                    |
+------------+--------------------------+
| TE06.12.03 | FT-TE                    |
+------------+--------------------------+
| TE06.13.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE06.13.02 | FT-TE                    |
+------------+--------------------------+
| TE06.13.03 | FT-TE                    |
+------------+--------------------------+
| TE06.14.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE06.14.02 | FT-TE                    |
+------------+--------------------------+
| TE06.14.03 | FT-TE                    |
+------------+--------------------------+
| TE06.15.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE06.15.02 | FT-TE                    |
+------------+--------------------------+
| TE06.15.03 | FT-TE                    |
+------------+--------------------------+
| TE06.17.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE06.17.02 | FT-TE                    |
+------------+--------------------------+
| TE06.17.03 | FT-TE                    |
+------------+--------------------------+
| TE06.18.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE06.18.02 | FT-TE                    |
+------------+--------------------------+
| TE06.18.03 | FT-TE                    |
+------------+--------------------------+
| TE06.19.01 | OD-TE                    |
+------------+--------------------------+
| TE06.20.01 | SP-TE                    |
+------------+--------------------------+
| TE06.24.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE06.25.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE06.25.02 | FT-TE                    |
+------------+--------------------------+
| TE06.26.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE06.26.02 | FT-TE                    |
+------------+--------------------------+
| TE06.27.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE06.27.02 | FT-TE                    |
+------------+--------------------------+
| TE06.28.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE06.28.02 | FT-TE                    |
+------------+--------------------------+
| TE06.28.03 | FT-TE                    |
+------------+--------------------------+
| TE06.28.04 | FT-TE                    |
+------------+--------------------------+
| TE07.01.01 | SP-TE                    |
+------------+--------------------------+
| TE07.01.02 | FT-TE                    |
+------------+--------------------------+
| TE07.09.01 | SP-TE                    |
+------------+--------------------------+
| TE07.09.02 | SP-TE                    |
+------------+--------------------------+
| TE07.10.01 | OD-TE                    |
+------------+--------------------------+
| TE07.10.02 | FT-TE                    |
+------------+--------------------------+
| TE07.11.01 | OD-TE                    |
+------------+--------------------------+
| TE07.11.02 | FT-TE                    |
+------------+--------------------------+
| TE07.12.01 | OD-TE                    |
+------------+--------------------------+
| TE07.13.01 | FT-TE                    |
+------------+--------------------------+
| TE07.15.01 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.15.02 | OD-TE                    |
+------------+--------------------------+
| TE07.19.01 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.20.01 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.25.01 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.26.01 | OD-TE FT-TE              |
+------------+--------------------------+
| TE07.26.02 | SP-TE                    |
+------------+--------------------------+
| TE07.27.01 | FT-TE                    |
+------------+--------------------------+
| TE07.32.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE07.33.01 | OD-TE                    |
+------------+--------------------------+
| TE07.35.01 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.37.01 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.37.02 | OD-TE                    |
+------------+--------------------------+
| TE07.37.03 | FT-TE                    |
+------------+--------------------------+
| TE07.39.01 | OD-TE                    |
+------------+--------------------------+
| TE07.39.02 | OD-TE                    |
+------------+--------------------------+
| TE07.39.03 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.39.04 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.39.05 | FT-TE                    |
+------------+--------------------------+
| TE07.39.06 | FT-TE                    |
+------------+--------------------------+
| TE07.41.01 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.41.02 | FT-TE                    |
+------------+--------------------------+
| TE07.42.01 | OD-TE                    |
+------------+--------------------------+
| TE07.42.02 | FT-TE                    |
+------------+--------------------------+
| TE07.43.01 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.44.01 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.45.01 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.45.02 | FT-TE                    |
+------------+--------------------------+
| TE07.46.01 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.47.01 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.47.02 | FT-TE                    |
+------------+--------------------------+
| TE07.48.01 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.48.02 | FT-TE                    |
+------------+--------------------------+
| TE07.50.01 | OD-TE                    |
+------------+--------------------------+
| TE07.50.02 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.50.03 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.51.01 | OD-TE                    |
+------------+--------------------------+
| TE07.51.02 | OD-TE                    |
+------------+--------------------------+
| TE07.51.03 | OD-TE                    |
+------------+--------------------------+
| TE07.51.04 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.51.05 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.51.06 | FT-TE                    |
+------------+--------------------------+
| TE07.51.07 | OD-TE                    |
+------------+--------------------------+
| TE07.51.08 | FT-TE                    |
+------------+--------------------------+
| TE07.51.09 | FT-TE                    |
+------------+--------------------------+
| TE07.53.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE07.55.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE07.57.01 | OD-TE                    |
+------------+--------------------------+
| TE07.58.01 | FT-TE                    |
+------------+--------------------------+
| TE07.60.01 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.62.01 | FT-TE                    |
+------------+--------------------------+
| TE07.63.01 | FT-TE                    |
+------------+--------------------------+
| TE07.65.01 | OD-TE                    |
+------------+--------------------------+
| TE07.65.02 | OD-TE                    |
+------------+--------------------------+
| TE07.65.03 | OD-TE                    |
+------------+--------------------------+
| TE07.65.04 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.65.05 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.65.06 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE07.65.07 | OD-TE                    |
+------------+--------------------------+
| TE07.65.08 | FT-TE                    |
+------------+--------------------------+
| TE07.65.09 | FT-TE                    |
+------------+--------------------------+
| TE07.67.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE07.71.01 | OD-TE                    |
+------------+--------------------------+
| TE07.71.02 | FT-TE                    |
+------------+--------------------------+
| TE07.73.01 | OD-TE                    |
+------------+--------------------------+
| TE07.77.01 | FT-TE                    |
+------------+--------------------------+
| TE07.77.02 | FT-TE                    |
+------------+--------------------------+
| TE07.77.03 | FT-TE                    |
+------------+--------------------------+
| TE07.77.04 | SP-TE                    |
+------------+--------------------------+
| TE07.81.01 | FT-TE                    |
+------------+--------------------------+
| TE07.81.02 | FT-TE                    |
+------------+--------------------------+
| TE07.81.03 | SP-TE                    |
+------------+--------------------------+
| TE08.03.01 | OD-TE                    |
+------------+--------------------------+
| TE08.04.01 | OD-TE                    |
+------------+--------------------------+
| TE08.05.01 | OD-TE                    |
+------------+--------------------------+
| TE08.06.01 | OD-TE                    |
+------------+--------------------------+
| TE08.07.01 | OD-TE                    |
+------------+--------------------------+
| TE09.01.01 | OD-TE                    |
+------------+--------------------------+
| TE09.01.02 | FT-TE                    |
+------------+--------------------------+
| TE09.01.03 | FT-TE                    |
+------------+--------------------------+
| TE09.02.01 | OD-TE                    |
+------------+--------------------------+
| TE09.02.02 | FT-TE                    |
+------------+--------------------------+
| TE09.03.01 | OD-TE                    |
+------------+--------------------------+
| TE09.03.02 | FT-TE                    |
+------------+--------------------------+
| TE09.03.03 | FT-TE                    |
+------------+--------------------------+
| TE09.04.01 | SP-TE                    |
+------------+--------------------------+
| TE09.04.02 | SP-TE                    |
+------------+--------------------------+
| TE09.05.01 | OD-TE                    |
+------------+--------------------------+
| TE09.06.01 | SP-TE                    |
+------------+--------------------------+
| TE09.06.02 | SP-TE                    |
+------------+--------------------------+
| TE09.06.03 | SP-TE                    |
+------------+--------------------------+
| TE09.07.01 | SP-TE                    |
+------------+--------------------------+
| TE09.08.01 | SP-TE                    |
+------------+--------------------------+
| TE09.08.02 | OD-TE                    |
+------------+--------------------------+
| TE09.09.01 | SP-TE                    |
+------------+--------------------------+
| TE09.09.02 | SP-TE                    |
+------------+--------------------------+
| TE09.10.01 | SP-TE                    |
+------------+--------------------------+
| TE09.10.02 | SP-TE                    |
+------------+--------------------------+
| TE09.13.01 | SP-TE                    |
+------------+--------------------------+
| TE09.13.02 | SP-TE                    |
+------------+--------------------------+
| TE09.13.03 | FT-TE                    |
+------------+--------------------------+
| TE09.14.01 | OD-TE                    |
+------------+--------------------------+
| TE09.14.02 | FT-TE                    |
+------------+--------------------------+
| TE09.16.01 | OD-TE                    |
+------------+--------------------------+
| TE09.16.02 | OD-TE                    |
+------------+--------------------------+
| TE09.16.03 | FT-TE                    |
+------------+--------------------------+
| TE09.18.01 | FT-TE                    |
+------------+--------------------------+
| TE09.18.02 | FT-TE                    |
+------------+--------------------------+
| TE09.19.01 | SP-TE                    |
+------------+--------------------------+
| TE09.21.01 | OD-TE                    |
+------------+--------------------------+
| TE09.21.02 | FT-TE                    |
+------------+--------------------------+
| TE09.21.03 | FT-TE                    |
+------------+--------------------------+
| TE09.21.04 | FT-TE                    |
+------------+--------------------------+
| TE09.22.01 | FT-TE                    |
+------------+--------------------------+
| TE09.23.01 | OD-TE                    |
+------------+--------------------------+
| TE09.23.02 | OD-TE                    |
+------------+--------------------------+
| TE09.23.03 | FT-TE/OD-TE              |
+------------+--------------------------+
| TE09.23.04 | OD-TE                    |
+------------+--------------------------+
| TE09.24.01 | OD-TE                    |
+------------+--------------------------+
| TE09.24.02 | FT-TE                    |
+------------+--------------------------+
| TE09.25.01 | OD-TE                    |
+------------+--------------------------+
| TE09.25.02 | FT-TE                    |
+------------+--------------------------+
| TE09.27.01 | OD-TE                    |
+------------+--------------------------+
| TE09.27.02 | FT-TE                    |
+------------+--------------------------+
| TE09.28.01 | SP-TE                    |
+------------+--------------------------+
| TE09.28.02 | FT-TE                    |
+------------+--------------------------+
| TE09.28.03 | FT-TE                    |
+------------+--------------------------+
| TE09.28.04 | FT-TE                    |
+------------+--------------------------+
| TE09.28.05 | SP-TE                    |
+------------+--------------------------+
| TE09.28.06 | OD-TE                    |
+------------+--------------------------+
| TE09.29.01 | OD-TE                    |
+------------+--------------------------+
| TE09.29.02 | OD-TE                    |
+------------+--------------------------+
| TE09.31.01 | OD-TE                    |
+------------+--------------------------+
| TE09.32.01 | OD-TE                    |
+------------+--------------------------+
| TE09.33.01 | SP-TE                    |
+------------+--------------------------+
| TE09.33.02 | FT-TE                    |
+------------+--------------------------+
| TE09.36.01 | OD-TE                    |
+------------+--------------------------+
| TE09.36.02 | FT-TE                    |
+------------+--------------------------+
| TE09.37.01 | SP-TE                    |
+------------+--------------------------+
| TE09.37.02 | FT-TE                    |
+------------+--------------------------+
| TE10.07.01 | SP-TE                    |
+------------+--------------------------+
| TE10.07.02 | SP-TE                    |
+------------+--------------------------+
| TE10.07.03 | FT-TE                    |
+------------+--------------------------+
| TE10.07.04 | FT-TE                    |
+------------+--------------------------+
| TE10.07.05 | FT-TE/SC-TE              |
+------------+--------------------------+
| TE10.08.01 | SP-TE                    |
+------------+--------------------------+
| TE10.08.02 | SP-TE                    |
+------------+--------------------------+
| TE10.08.03 | FT-TE                    |
+------------+--------------------------+
| TE10.09.01 | SP-TE                    |
+------------+--------------------------+
| TE10.09.02 | SP-TE                    |
+------------+--------------------------+
| TE10.09.03 | FT-TE                    |
+------------+--------------------------+
| TE10.10.01 | FT-TE                    |
+------------+--------------------------+
| TE10.10.02 | FT-TE                    |
+------------+--------------------------+
| TE10.11.01 | FT-TE                    |
+------------+--------------------------+
| TE10.12.01 | OD-TE                    |
+------------+--------------------------+
| TE10.12.02 | OD-TE                    |
+------------+--------------------------+
| TE10.12.03 | FT-TE                    |
+------------+--------------------------+
| TE10.12.04 | FT-TE                    |
+------------+--------------------------+
| TE10.12.05 | FT-TE                    |
+------------+--------------------------+
| TE10.15.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE10.15.02 | SC-TE/OD-TE, FT-TE       |
+------------+--------------------------+
| TE10.20.01 | SC-TE/OD-TE              |
+------------+--------------------------+
| TE10.21.01 | OD-TE, FT-TE             |
+------------+--------------------------+
| TE10.21.02 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE10.21.03 | FT-TE                    |
+------------+--------------------------+
| TE10.21.04 | FT-TE                    |
+------------+--------------------------+
| TE10.22.01 | FT-TE                    |
+------------+--------------------------+
| TE10.22.02 | SC-TE/OD-TE              |
+------------+--------------------------+
| TE10.22.03 | SC-TE/OD-TE              |
+------------+--------------------------+
| TE10.22.04 | FT-TE                    |
+------------+--------------------------+
| TE10.22.05 | SC-TE/OD-TE              |
+------------+--------------------------+
| TE10.24.01 | SP-TE                    |
+------------+--------------------------+
| TE10.24.02 | SC-TE/OD-TE              |
+------------+--------------------------+
| TE10.25.01 | SP-TE                    |
+------------+--------------------------+
| TE10.25.02 | FT-TE                    |
+------------+--------------------------+
| TE10.27.01 | FT-TE, OD-TE             |
+------------+--------------------------+
| TE10.28.01 | OD-TE, SC-TE             |
+------------+--------------------------+
| TE10.28.02 | FT-TE                    |
+------------+--------------------------+
| TE10.29.01 | SC-TE, OD-TE             |
+------------+--------------------------+
| TE10.33.01 | SP-TE                    |
+------------+--------------------------+
| TE10.33.02 | SC-TE/OD-TE              |
+------------+--------------------------+
| TE10.34.01 | SP-TE                    |
+------------+--------------------------+
| TE10.34.02 | OD-TE, SC-TE             |
+------------+--------------------------+
| TE10.34.03 | FT-TE                    |
+------------+--------------------------+
| TE10.35.01 | OD-TE, SC-TE             |
+------------+--------------------------+
| TE10.35.02 | OD-TE, SC-TE             |
+------------+--------------------------+
| TE10.35.03 | OD-TE, SC-TE             |
+------------+--------------------------+
| TE10.35.04 | FT-TE                    |
+------------+--------------------------+
| TE10.37.01 | SP-TE                    |
+------------+--------------------------+
| TE10.37.02 | SP-TE                    |
+------------+--------------------------+
| TE10.37.03 | OD-TE                    |
+------------+--------------------------+
| TE10.37.04 | SC-TE/OD-TE              |
+------------+--------------------------+
| TE10.37.05 | FT-TE                    |
+------------+--------------------------+
| TE10.37.06 | FT-TE                    |
+------------+--------------------------+
| TE10.37.07 | SC-TE/OD-TE              |
+------------+--------------------------+
| TE10.37.08 | SC-TE/OD-TE              |
+------------+--------------------------+
| TE10.37.09 | FT-TE                    |
+------------+--------------------------+
| TE10.46.01 | OD-TE                    |
+------------+--------------------------+
| TE10.46.02 | SC-TE, OD-TE             |
+------------+--------------------------+
| TE10.46.03 | FT-TE                    |
+------------+--------------------------+
| TE10.46.04 | FT-TE                    |
+------------+--------------------------+
| TE10.48.01 | FT-TE                    |
+------------+--------------------------+
| TE10.48.02 | SC-TE, OD-TE             |
+------------+--------------------------+
| TE10.48.03 | FT-TE                    |
+------------+--------------------------+
| TE10.49.01 | FT-TE                    |
+------------+--------------------------+
| TE10.49.02 | SC-TE, OD-TE             |
+------------+--------------------------+
| TE10.49.03 | FT-TE                    |
+------------+--------------------------+
| TE10.51.01 | SC-TE, OD-TE             |
+------------+--------------------------+
| TE10.51.02 | SC-TE, OD-TE             |
+------------+--------------------------+
| TE10.51.03 | SC-TE, OD-TE             |
+------------+--------------------------+
| TE10.53.01 | SP-TE                    |
+------------+--------------------------+
| TE10.53.02 | FT-TE                    |
+------------+--------------------------+
| TE10.53.03 | FT-TE                    |
+------------+--------------------------+
| TE10.54.01 | FT-TE, SC-TE             |
+------------+--------------------------+
| TE11.01.01 | OD-TE                    |
+------------+--------------------------+
| TE11.03.01 | OD-TE                    |
+------------+--------------------------+
| TE11.04.01 | OD-TE                    |
+------------+--------------------------+
| TE11.04.02 | OD-TE                    |
+------------+--------------------------+
| TE11.04.03 | OD-TE                    |
+------------+--------------------------+
| TE11.04.04 | OD-TE                    |
+------------+--------------------------+
| TE11.05.01 | OD-TE                    |
+------------+--------------------------+
| TE11.06.01 | OD-TE                    |
+------------+--------------------------+
| TE11.08.01 | OD(FSM)-TE               |
+------------+--------------------------+
| TE11.08.02 | OD(FSM)-TE               |
+------------+--------------------------+
| TE11.08.03 | OD(FSM)-TE               |
+------------+--------------------------+
| TE11.08.04 | OD(FSM)-TE               |
+------------+--------------------------+
| TE11.08.05 | OD(FSM)-TE               |
+------------+--------------------------+
| TE11.08.06 | FT-TE                    |
+------------+--------------------------+
| TE11.08.07 | OD(FSM)-TE               |
+------------+--------------------------+
| TE11.08.08 | OD(FSM)-TE               |
+------------+--------------------------+
| TE11.08.09 | FT-TE                    |
+------------+--------------------------+
| TE11.08.10 | OD(FSM)-TE               |
+------------+--------------------------+
| TE11.08.11 | OD(FSM)-TE               |
+------------+--------------------------+
| TE11.08.12 | OD(FSM)-TE               |
+------------+--------------------------+
| TE11.11.01 | FT-TE                    |
+------------+--------------------------+
| TE11.13.01 | OD(FSM)-TE               |
+------------+--------------------------+
| TE11.13.02 | FT-TE                    |
+------------+--------------------------+
| TE11.15.01 | OD-TE                    |
+------------+--------------------------+
| TE11.15.02 | OD-TE                    |
+------------+--------------------------+
| TE11.16.01 | SC-TE/OD-TE              |
+------------+--------------------------+
| TE11.17.01 | SC-TE/OD-TE              |
+------------+--------------------------+
| TE11.18.01 | SC-TE/OD-TE              |
+------------+--------------------------+
| TE11.19.01 | OD-TE                    |
+------------+--------------------------+
| TE11.21.01 | OD-TE                    |
+------------+--------------------------+
| TE11.23.01 | OD-TE                    |
+------------+--------------------------+
| TE11.24.01 | SC-TE                    |
+------------+--------------------------+
| TE11.25.01 | OD-TE                    |
+------------+--------------------------+
| TE11.26.01 | OD-TE                    |
+------------+--------------------------+
| TE11.28.01 | SC-TE                    |
+------------+--------------------------+
| TE11.28.02 | FT-TE/OD-TE, SC-TE       |
+------------+--------------------------+
| TE11.28.03 | FT-TE/OD-TE, SC-TE       |
+------------+--------------------------+
| TE11.28.04 | FT-TE/OD-TE              |
+------------+--------------------------+
| TE11.29.01 | OD-TE                    |
+------------+--------------------------+
| TE11.29.02 | OD-TE                    |
+------------+--------------------------+
| TE11.30.01 | OD-TE                    |
+------------+--------------------------+
| TE11.31.01 | OD-TE                    |
+------------+--------------------------+
| TE11.32.01 | SP-TE                    |
+------------+--------------------------+
| TE11.32.02 | FT-TE                    |
+------------+--------------------------+
| TE11.33.01 | OD-TE                    |
+------------+--------------------------+
| TE11.34.01 | OD-TE                    |
+------------+--------------------------+
| TE11.35.01 | SP-TE                    |
+------------+--------------------------+
| TE11.36.01 | SP-TE                    |
+------------+--------------------------+
| TE11.37.01 | SP-TE                    |
+------------+--------------------------+
| TE11.38.01 | SP-TE                    |
+------------+--------------------------+
| TE11.38.03 | OD-TE                    |
+------------+--------------------------+
| TE11.39.01 | SP-TE                    |
+------------+--------------------------+
| TE12.01.01 | OD-TE                    |
+------------+--------------------------+
| TE12.02.01 | SP-TE                    |
+------------+--------------------------+
| TE12.04.01 | SP-TE                    |
+------------+--------------------------+
| TE12.04.02 | OD-TE                    |
+------------+--------------------------+
| TE12.04.03 | SP-TE                    |
+------------+--------------------------+
| TEA01.01   | OD-TE                    |
+------------+--------------------------+
| TEB01.01   | SP-TE                    |
+------------+--------------------------+
| TEB02.01   | SP-TE                    |
+------------+--------------------------+
| TEB03.01   | SP-TE                    |
+------------+--------------------------+
| TEB03.02   | SP-TE                    |
+------------+--------------------------+

Test Methods for Functional Testing TEs
---------------------------------------

The diverse set of cryptographic modules and their varying restrictive operating environments can create challenges in choosing the right approach and selecting an appropriate toolset to capture the evaluation TE. The CMVP provides some limited guidance, but it is necessary to identify which test methods are relevant to the granularity of individual TEs.

Testing Access
______________

There is frequently a challenge in accessing the operational environment for effective testing of a cryptographic module. There are allowances for various methodologies to follow for accommodating these challenges. For any given evaluation, it is assumed by default that the Testing Access used for all TEs is the same; however, any given TE might in fact require an alternate allowed Testing Access method to be used.

The Testing Access methods are as follows:

**Physical:** Testing a module directly by lab personnel within a controlled lab environment.

**Remote:** Testing a module remotely while obtaining the equivalent assurance as if the test were performed at the vendor's facility.

**Observed:** Testing a module by vendor personnel within a controlled lab environment while lab personnel observe the triggering and responses of the module.

Selection Criteria
__________________

The challenge is to assign only the appropriate test methods to each of the identified TEs. Drawing from CMVP, lab, and original vendor expertise, the criteria can be used to refine the test methods to be used for each TE.

Test methods are the defined techniques that can be utilized while ensuring confidence in capturing actual module operation under real-world conditions and enabling an efficient evidence-gathering workflow. Only a limited set of test method categories exists for the team to focus on in their pursuit, which can best be described as:

- **Debugger:** The ability to run or halt the target program using breakpoints, step through code line by line, and display or modify the contents of memory, CPU registers, and stack frames.

- **Simulation:** Imitates the representation of the functioning of one system or process by means of the functioning of another.

- **Emulation:** Hardware or software that permits programs written for one environment to be run unaltered on another environment.

- **Harness:** Hardware or software that manipulates an operating environment with the purpose of triggering events and capturing the corresponding responses or results.

- **Manual:** Action(s) by a user to perform a set of designated steps for the purpose of triggering events and capturing the corresponding responses or results.

- **Other:** Due to the diversity and complexity of operating environments, the toolset needed to perform the gathering of relevant TE may not fit precisely within the above five test methods. This warrants the need for a catch-all method that enables the tester to comprehensively describe the methodology used to capture the TE.

Debugger
^^^^^^^^

No clearly articulated interpretation of when and how a debugger can and should be used is available, as much of what is known comes from lab empirical evidence.

Simulation and/or Emulation
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Drawing from guidance currently provided by CMVP in the `Management Manual, dated 10/16/2025, Version 2.5 <https://csrc.nist.gov/csrc/media/Projects/cryptographic-module-validation-program/documents/fips%20140-3/FIPS-140-3-CMVP%20Management%20Manual.pdf>`__, labs may apply emulators or simulators, depending on the type of testing results to be achieved. The three broad areas of focus during the testing of a cryptographic module are operational testing of the module at the module's defined boundary, operational fault induction testing, and algorithm testing.

1. **Operational Testing** - Emulation or simulation is prohibited for the operational testing of a cryptographic module. Actual testing of the cryptographic module must be performed utilizing the defined ports, interfaces, and services that a module provides. A test harness or a modified version to induce an error may be utilized; however, no changes to code or circuitry responsible for the tested response may be made.

2. **Operational Fault Induction Testing** - An emulator or simulator may be utilized for fault induction to test a cryptographic module's transition to error states as a complement to the source code review. Rationale must be provided for the applicable TE as to why a method does not exist to induce the actual module into the error state for testing.

3. **Algorithm Testing** - Algorithm testing utilizing the defined ports, interfaces, and services that a module provides is the preferred method. This method most clearly meets the requirements of FIPS 140-3 Implementation Guidance (IG) 2.3.A. If this preferred method is not possible where the module's defined set of ports, interfaces, and services does not allow access to internal algorithmic engines, two alternative methods may be utilized:

   a. A module may be modified under the supervision of the Cryptographic and Security Testing Laboratory (CSTL) for testing purposes to allow access to the algorithmic engines (e.g., test jig, test API), or

   b. A module simulator may be utilized.

Harness
^^^^^^^^

No clearly articulated interpretation of when and how a test harness can and should be used is available, as much of what is known comes from experienced vendors who developed specialized test harnesses around their respective modules and within the restricted operating environments.

Manual
^^^^^^

No clearly articulated interpretation of when and how a manual process can and should be used is available, as much of what is known comes from the need for human interaction to trigger events or an inability to trigger the steps in an automated approach.

Other
^^^^^

As noted earlier, due to the diversity and complexity of operating environments, the toolset needed to perform the gathering of relevant TE may not fit precisely within the above five test methods. Therefore, there is a need for a catch-all method that enables the tester to comprehensively describe the methodology used to capture the TE. The testing techniques can evolve over time and emergent testing techniques can be added to this list.

Test Methods Allowed
____________________

Table 4 maps the allowed test methods to the grouping of associated TEs for the purpose of condensing the resulting table.

.. table:: Table 4 Allowed Test Methods

   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | **TE (TE##.##.##** | **Debugger** | **Simulator** | **Emulator** | **Harness** | **Manual** | **Other** |
   +====================+==============+===============+==============+=============+============+===========+
   | 02.12.01           | X            | X             | X            | X           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 02.13.03           | X            | X             | X            | ✔           | X          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 02.15.03           | X            | X             | X            | X           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 02.15.05,          | ✔            | X             | X            | X           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 02.16.04,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 02.17.04           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 02.16.02,          | X            | X             | X            | ✔           | X          | ✔         |
   |                    |              |               |              |             |            |           |
   | 02.17.02           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 02.19.02           | ✔            | X             | X            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 02.22.02           | ✔            | X             | X            | ✔           | X          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 02.24.02           | ✔            | X             | X            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 02.26.03,          | ✔            | X             | X            | ✔           | X          | ✔         |
   |                    |              |               |              |             |            |           |
   | 02.26.04,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 02.26.05,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 02.28.01,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 02.28.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 02.30.02           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 03.01.04,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 03.02.01,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 03.14.03,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 03.15.03,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 03.15.04,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 03.15.06           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 03.05.01,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 03.05.02           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 03.06.01,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 03.06.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 03.07.01,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 03.07.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 03.07.04,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 03.07.08           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 03.08.01,          | ✔            | ✔             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 03.08.02           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 03.09.02,          | ✔            | ✔             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 03.10.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 03.10.04           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 03.11.01,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 03.11.03           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 03.13.02           | X            | X             | X            | X           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 03.18.02,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 03.19.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 03.19.04,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 03.20.01,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 03.21.01           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 03.22.01           | ✔            | X             | X            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 04.02.02,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 04.02.03           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 04.07.03           | ✔            | X             | X            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 04.11.02           | ✔            | X             | X            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 04.13.01,          | ✔            | ✔             | ✔            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 04.13.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 04.13.03           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 04.14.02           | ✔            | X             | X            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 04.15.01           | ✔            | X             | X            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 04.18.01,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 04.19.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 04.19.03,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 04.20.01,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 04.20.03,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 04.21.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 04.22.02           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 04.23.01,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 04.25.01,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 04.25.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 04.25.03           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 04.28.01,          | ✔            | ✔             | ✔            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 04.29.01,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 04.32.01,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 04.33.01,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 04.34.01,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 04.35.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 05.13.08           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 04.37.02,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 04.38.02           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 04.39.02,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 04.39.03,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 04.39.04,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 04.42.03,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 04.42.04           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 04.43.02,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 04.44.02           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 04.45.02,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 04.45.03,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 04.47.01,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 04.48.01,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 04.52.01,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 04.54.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 04.54.03,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 04.55.02           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 04.53.01           | ✔            | ✔             | ✔            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 04.56.02           | ✔            | X             | X            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 04.59.01           | ✔            | X             | X            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 05.05.05           | ✔            | ✔             | ✔            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 05.05.07,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 05.06.06,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 05.08.01,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 05.08.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 05.11.01,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 05.11.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 05.12.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 05.13.03,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 05.13.04,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 05.13.05           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 05.06.02           | ✔            | ✔             | ✔            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 05.06.03           | ✔            | X             | X            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 05.06.04           | ✔            | X             | X            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 05.13.01,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 05.13.02           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 05.13.06           | ✔            | X             | X            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 05.15.01,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 05.15.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 05.16.03,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 05.17.02           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 05.20.01           | ✔            | ✔             | ✔            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 05.23.01           | ✔            | ✔             | ✔            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 06.05.01,          | ✔            | ✔             | ✔            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 06.05.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 06.05.03,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 06.06.01,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 06.06.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 06.08.01,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 06.08.03           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 06.06.02,          | ✔            | ✔             | ✔            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 06.08.03           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 09.01.02,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 09.01.03,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 09.02.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 09.03.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 09.03.03,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 09.14.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 09.16.03,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 09.25.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 09.27.02           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 09.21.02,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 09.21.03,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 09.21.04,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 09.22.01           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 09.24.02           | ✔            | X             | X            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 09.28.02,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 09.28.03,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 09.28.04           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 09.33.02           | ✔            | X             | X            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 09.36.02,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 09.37.02           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 10.07.03,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 10.08.03,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 10.09.03,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 10.10.01,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 10.10.02,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 10.28.02           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 10.07.04           | ✔            | X             | X            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 10.25.02,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 10.27.01           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 10.35.04           | ✔            | ✔             | X            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 10.53.02,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 10.53.03           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 11.08.06,          | ✔            | X             | X            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 11.08.09,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 11.11.01           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 11.13.02           | ✔            | X             | X            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 11.28.02,          | ✔            | ✔             | ✔            | ✔           | ✔          | ✔         |
   |                    |              |               |              |             |            |           |
   | 11.28.03,          |              |               |              |             |            |           |
   |                    |              |               |              |             |            |           |
   | 11.28.04           |              |               |              |             |            |           |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+
   | 11.32.02           | ✔            | X             | X            | ✔           | ✔          | ✔         |
   +--------------------+--------------+---------------+--------------+-------------+------------+-----------+

Improvement of TE Filtering Coverage
------------------------------------

TE filters serve as a pivotal mechanism to streamline the classification and evaluation of TE, ensuring that only relevant and applicable tests are conducted based on specific module characteristics. A proper set of applicable TEs tailored by a given module specification refines the required assessments and optimizes the validation process.

With the growing complexity of cryptographic modules and the need for efficient validation, TE filters are designed to:

- Target specific needs through focusing on applicable tests by narrowing down evidence requirements based on module attributes such as type, security level, and operational environment

- Reduce redundancy through minimizing repetitive validation steps by filtering out TEs that are not relevant to a given module's configuration or features

- Enhance automation through supporting automated workflows by integrating filters into structured JSON schemas, aligning with automation tools like WebCryptik

This document delves into the methodologies and criteria for applying TE filters, the implementation of filtering mechanisms, and their role in achieving a more efficient and scalable CMVP. By leveraging these filters, vendors and validators can focus on precise compliance requirements, reducing manual overhead while maintaining robust security standards.

Table 5 is excerpted from ISO/IEC 19790:2012, which is the base of FIPS 140-3. It provides a structured summary of the FIPS 140-3 security requirements across various requirement areas. It outlines the security levels applicable to each category, specifying the testing expectations and security assurances needed to meet compliance. The table serves as a reference for understanding how different cryptographic module components must align with FIPS 140-3 standards, ensuring consistent evaluation and validation. Each requirement area focuses on distinct security aspects, such as module specifications, authentication mechanisms, physical security, and lifecycle assurance, enabling a comprehensive approach to cryptographic module validation.

.. table:: Table 5 Summary of FIPS 140-3 Security Requirements

   +------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | **Requirement Area**                                 | **FIPS 140-3 Security Level**                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
   |                                                      +--------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+
   |                                                      |    **1**                                                                                               |    **2**                                                                                               |    **3**                                                                                                                   |    **4**                                                                                                                                          |
   +============+=========================================+========================================================================================================+========================================================================================================+============================================================================================================================+===================================================================================================================================================+
   | 1          | **General**                             | No security testing requirements (i.e., no TEs)                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
   +------------+-----------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | 2          | **Cryptographic Module Specification**  | Specification of cryptographic module, cryptographic boundary, approved security functions, and normal and degraded modes of operation. Description of cryptographic module, including all hardware, software, and firmware components. All services provide status information to indicate when the service utilizes an approved cryptographic algorithm, security function, or process in an approved manner.                                                                                  |
   +------------+-----------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | 3          | **Cryptographic Module Interfaces**     | Required and optional interfaces. Specification of all interfaces and of all input and output data paths                                                                                                        | Trusted channel                                                                                                                                                                                                                                                                |
   +------------+-----------------------------------------+--------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+
   | 4          | **Roles, Services, and Authentication** | Logical separation of required and optional roles and services                                         | Role-based or identity-based operator authentication                                                   | Identity-based operator authentication                                                                                     | Multi-factor authentication                                                                                                                       |
   +------------+-----------------------------------------+--------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+
   | 5          | **Software / Firmware Security**        | Approved integrity technique. Defined SFMI, HFMI, and HSMI. Executable code                            | Approved digital signature or keyed message authentication code-based integrity test                   | Approved digital signature-based integrity test                                                                                                                                                                                                                                |
   +------------+-----------------------------------------+--------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | 6          | **Operational Environment**             | Non-modifiable. Limited or Modifiable Control of SSPs                                                  | Modifiable. Role-based or discretionary access control. Audit mechanism                                |                                                                                                                                                                                                                                                                                |
   +------------+-----------------------------------------+--------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+
   | 7          | **Physical Security**                   | Production-grade components                                                                            | Tamper evidence. Opaque covering or enclosure                                                          | Tamper detection and response for covers and doors. Strong enclosure or coating. Protection from direct probing EFP or EFT | Tamper detection and response envelope. EFP. Fault injection mitigation                                                                           |
   +------------+-----------------------------------------+--------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+
   | 8          | **Non-Invasive Security**               | Module is designed to mitigate against non-invasive attacks specified in Annex “F”                                                                                                                                                                                                                                                                                                                                                                                                               |
   |            |                                         +-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+
   |            |                                         | Documentation and effectiveness of mitigation techniques specified in Annex “F”                                                                                                                                 | Mitigation testing                                                                                                         | Mitigation testing                                                                                                                                |
   +------------+-----------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+
   | 9          | **Security Parameter Management**       | Random bit generators, SSP generation, establishment, entry & output, storage & zeroization                                                                                                                                                                                                                                                                                                                                                                                                      |
   |            |                                         +--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   |            |                                         | Automated SSP transport or SSP agreement using approved methods                                                                                                                                                                                                                                                                                                                                                                                                                                  |
   |            |                                         +-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   |            |                                         | Manually established SSPs may be entered or output in plaintext form                                                                                                                                            | Manually established SSPs may be entered or output in either encrypted form, via a trusted channel, or using split knowledge procedures                                                                                                                                        |
   +------------+-----------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | 10         | **Self-Tests**                          | Pre-operational: software/firmware integrity, bypass, and critical functions test                                                                                                                                                                                                                                                                                                                                                                                                                |
   |            |                                         +--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   |            |                                         | Conditional: cryptographic algorithm, pair-wise consistency, SW/FW loading, manual entry, conditional bypass & critical functions test                                                                                                                                                                                                                                                                                                                                                           |
   +------------+-----------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | 11         | **Life-Cycle Assurance**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
   |            +-----------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   |            | **Configuration Management**            | Configuration management system for cryptographic module, components, and documentation. Each is uniquely identified and tracked throughout its lifecycle                                                       | Automated configuration management system                                                                                                                                                                                                                                      |
   |            +-----------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   |            | **Design**                              | Module designed to allow testing of all provided security-related services                                                                                                                                                                                                                                                                                                                                                                                                                       |
   |            +-----------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   |            | **FSM**                                 | Finite State Model                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
   |            +-----------------------------------------+--------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+
   |            | **Development**                         | Annotated source code, schematics, or HDL                                                              | Software high-level language and hardware high-level descriptive language                                                                                                                                                           | Documentation annotated with pre-conditions upon entry into module components and postconditions expected to be true when components is completed |
   |            +-----------------------------------------+--------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+
   |            | **Testing**                             | Functional testing                                                                                                                                                                                              | Low-level testing                                                                                                                                                                                                                                                              |
   |            +-----------------------------------------+--------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+
   |            | **Delivery & Operation**                | Initialization procedures                                                                              | Delivery procedures                                                                                                                                                                                                                 | Operator authentication using vendor-provided authentication information                                                                          |
   |            +-----------------------------------------+--------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+
   |            | **Guidance**                            | Administrator and non-administrator guidance                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
   +------------+-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+
   | 12         | **Mitigation of Other Attacks**         | Specification of mitigation of attacks for which no testable requirements are currently available                                                                                                                                                                                                                                            | Specification of mitigation of attacks with testable requirements                                                                                 |
   +------------+-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+

Building on the summary of FIPS 140-3 security requirements in Table 5, Table 6 provides a more granular analysis of the number of security requirements per ISO/IEC 24759:2014(2015), which is a companion document to ISO/IEC 19790 specifying the derived test requirements, across different implementation areas. This table categorizes security requirements based on the module's type being Software (SW), Firmware (FW), Hardware (HW), SW-HW hybrid (SW-H), or FW-HW hybrid (FW-H), and further differentiates them by security levels. The breakdown facilitates a clearer understanding of the distribution of TE requirements, highlighting how various module implementations align with compliance expectations at each level.

The number of total TEs and the percentage of applicable TEs will indicate how many TEs are not applicable. By filtering out these non-applicable TEs with public consensus, the CSTL can more directly perform the required testing.

.. raw:: html

   <style> .red { background-color: red; color: white; } </style>
   <style> .g { background-color: green; color: white; } </style>

.. role:: red
.. role:: g

.. table:: Table 6 An overview of the number of Security Requirements

   +------------------+---------------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+
   | **Area**         | **Total TEs** | **Security Level 1** |         |         |         |         | **Security Level 2** |         |         |         |         | **Security Level 3** |         |         |         |         | **Security Level 4** |         |         |         |         |
   +==================+===============+======================+=========+=========+=========+=========+======================+=========+=========+=========+=========+======================+=========+=========+=========+=========+======================+=========+=========+=========+=========+
   |                  |               | SW                   | FW      | HW      | SW-H    | FW-H    | SW                   | FW      | HW      | SW-H    | FW-H    | SW                   | FW      | HW      | SW-H    | FW-H    | SW                   | FW      | HW      | SW-H    | FW-H    |
   +------------------+---------------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+
   | **2**            | 65            | :red:`40`            | 45      | 49      | 55      | 60      | :red:`40`            | 45      | 49      | 55      | 60      | :red:`40`            | 45      | 49      | 55      | 60      | :red:`40`            | 45      | 49      | 55      | 60      |
   +------------------+---------------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+
   | **3**            | 53            | 41                   | 43      | 43      | 43      | 43      | 41                   | 43      | 43      | 43      | 43      | 46                   | 48      | 52      | 52      | 52      | 47                   | 49      | 53      | 53      | 53      |
   +------------------+---------------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+
   | **4**            | 74            | 45                   | 45      | 45      | 45      | 45      | 63                   | 63      | 63      | 63      | 63      | 70                   | 70      | 70      | 70      | 70      | 71                   | 71      | 71      | 71      | 71      |
   +------------------+---------------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+
   | **5**            | 39            | 23                   | 23      | 23      | 30      | 30      | 30                   | 30      | 29      | 37      | 37      | 32                   | 32      | 30      | 39      | 39      | 32                   | 32      | 30      | 39      | 39      |
   +------------------+---------------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+
   | **6**            | 50            | 10                   | 10      | 10      | 10      | 10      | 50                   | 50      | 50      | 50      | 50      | 0                    | 0       | 0       | 0       | 0       | 0                    | 0       | 0       | 0       | 0       |
   +------------------+---------------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+
   | **7**            | 82            | 0                    | 14      |:g:`14`  | 14      | 14      | 0                    | 27      | :g:`27` | 27      | 27      | 0                    | 69      | :g:`69` | 69      | 69      | 0                    | 78      | :g:`78` | 78      | 78      |
   +------------------+---------------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+
   | **8**            | 5             | 3                    | 3       | 3       | 3       | 3       | 3                    | 3       | 3       | 3       | 3       | 4                    | 4       | 4       | 4       | 4       | 4                    | 4       | 4       | 4       | 4       |
   +------------------+---------------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+
   | **9**            | 63            | 44                   | 43      | 43      | 44      | 43      | 48                   | 47      | 47      | 48      | 47      | 56                   | 56      | 56      | 56      | 56      | 57                   | 57      | 57      | 57      | 57      |
   +------------------+---------------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+
   | **10**           | 74            | 68                   | 68      | 68      | 68      | 68      | 68                   | 68      | 68      | 68      | 68      | 74                   | 74      | 74      | 74      | 74      | 74                   | 74      | 74      | 74      | 74      |
   +------------------+---------------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+
   | **11**           | 52            | 36                   | 36      | 35      | 38      | 38      | 41                   | 41      | 41      | 44      | 44      | 44                   | 44      | 44      | 47      | 47      | 49                   | 49      | 49      | 52      | 52      |
   +------------------+---------------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+
   | **12**           | 5             | 2                    | 2       | 2       | 2       | 2       | 2                    | 2       | 2       | 2       | 2       | 2                    | 2       | 2       | 2       | 2       | 5                    | 5       | 5       | 5       | 5       |
   +------------------+---------------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+
   | **A**            | 1             | 1                    | 1       | 1       | 1       | 1       | 1                    | 1       | 1       | 1       | 1       | 1                    | 1       | 1       | 1       | 1       | 1                    | 1       | 1       | 1       | 1       |
   +------------------+---------------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+
   | **B**            | 4             | 4                    | 4       | 4       | 4       | 4       | 4                    | 4       | 4       | 4       | 4       | 4                    | 4       | 4       | 4       | 4       | 4                    | 4       | 4       | 4       | 4       |
   +------------------+---------------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+
   | **Total TEs**    | **567**       | **317**              | **337** | **340** | **357** | **361** | **391**              | **424** | **427** | **445** | **449** | **373**              | **449** | **455** | **473** | **478** | **384**              | **469** | **475** | **493** | **498** |
   +------------------+---------------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+
   | **% Applicable** | **100**       | **56**               | **59**  | **60**  | **63**  | **64**  | **69**               | **75**  | **75**  | **78**  | **79**  | **66**               | **79**  | **80**  | **83**  | **84**  | **68**               | **83**  | **84**  | **87**  | **88**  |
   +------------------+---------------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+----------------------+---------+---------+---------+---------+

We recognize that software implementations only support levels 1 and 2. However:

- The Area 2 TEs include requirements from security level 1 through level 4, which are listed in Table 7. This area's requirements are about the Cryptographic Module Specification and are the same for all four security levels. The unified area 2 requirements are reflected by the numbers of TEs in the red rectangle boxes on Table 6.

- The Area 7 TEs include requirements from security level 1 through level 4, which are listed in Table 6. The Physical Security requirements in Area 7 are incremental for cryptographic modules from a low security level to a higher level. The numbers of TEs in the green rectangle boxes on Table 6 illustrate this trend.

Table 6 and Table 7 in :ref:`TEs impacted by basic TE filters` serve as examples of how the basic TE filters work by listing all applicable TEs and non-applicable TEs for a given type of module at any possible security level. A complete set of TE tables elaborating on Table 6 is provided in Appendix B of this document.

TE Filtering Criteria
_____________________

The TE Filtering criteria consists of the Module Information and Supplemental Information from the WebCryptik as the base. The CMVP provided `Module Supplemental Information <https://csrc.nist.gov/csrc/media/Projects/cryptographic-module-validation-program/documents/fips%20140-3/Module%20Processes/SupplementalItems-2025-06-25.pdf>`__ (dated 2025-06-25), but this is not currently used to tailor the set of TEs to fit the module under test.

In the CMVP's Module Supplemental Information (MSI) document, most Supplemental Information questions map to the security assertions (AS), test requirements (TE), implementation guidance (IG), and security policies (SP), but a few questions are not mapped to any of these and are left blank. The list below reflects the CMVP's current MSI document. The TE Workstream provides a complete mapping of MSI questions to relevant TEs in Table 8.

By reviewing all TEs contained in the WebCryptik Br1 v1.0.6, the TE Workstream completed the list of criteria, including the basic filters and supplemental filters, as follows:

- **Basic Filters**

  - Module Embodiment: Single Chip, Multi-Chip Embedded, Multi-Chip Standalone

  - Module Type: Software, Hardware, Firmware, Software-hybrid, Firmware-hybrid

  - Operational Environment: modifiable, limited, non-modifiable

  - Section Level: Per Table 4, area 6 is not applicable to Level 3 and Level 4

- **Supplemental Filters**

  - **Cryptographic module specification**

    - Does the module implement OTAR? - IG D.C

    - Does the module have a non-approved mode? - IG 2.4.A

    - Does the module require initialization steps to operate in the approved mode? - Certificate Caveat and SP

    - Does the module have excluded components? - AS02.13, AS02.14

    - Does the module allow a degraded mode of operation? - AS02.25

    - Does the module have an implementation of PAA or PAI? - IG 2.3.C

    - Does the module contain an embedded or have a bound cryptographic module? - IG 2.3.A

    - Does the module have any critical functions? - AS10.16, AS10.23, AS10.24, AS10.52

    - Is the module a sub-chip implementation? - IG 2.3.B

    - Does the module's approved mode make use of any non-approved algorithm? - IG 2.4.A

    - Does the module have a non-compliant state?

  - **Cryptographic module interfaces**

    - Does the module receive any of its input from an external input device? -TE03.05.02, TE03.06.02, TE03.08.02, TE03.11.02

    - Does the module provide any of its output through an external output device? - TE03.05.02, TE03.06.02, TE03.08.02, TE03.11.02

    - Does the module implement a Trusted Channel? - IG 3.4.A

    - Is there a control output interface? - AS03.09, AS03.10

  - **Roles, services, and authentication**

    - Does the module support concurrent operators? - AS04.02

    - Does the module support any authentication mechanism? - AS04.43-AS04.55

    - Does the module use identity-based authentication?

    - Does the module support role-based authentication?

    - Does the module support multi-factor-based authentication? - AS03.22

    - Does the module have a bypass capability? - AS04.22, AS10.21-AS10.22, AS10.47-AS10.51

    - Is there a maintenance role? - AS04.07

    - Is there a user role? - AS04.06

    - Can operators change roles? - AS04.38, AS04.42

    - Does the module support self-initiated cryptographic output? - AS04.23-AS04.26

    - Is default information used for first-time authentication? - AS04.46

    - Does the module support software/firmware loading? - AS04.28-AS04.33, AS05.13

    - Is a complete image replacement supported within software/firmware loading? - AS04.33-AS04.35

  - **Software/firmware security**

    - Does the module use a hash or MAC to verify the integrity of its software/firmware? - TE05.05.03

    - Does the module use a digital signature to verify the integrity of its software/firmware? - TE05.05.04

    - Does the module use an EDC for the software/firmware components of a hardware module? - AS05.06

    - Does the module contain any non-reconfigurable memory? - IG 5.A

    - Does the module utilize open-source software? - Annex B

  - **Operational environment**

    - None

  - **Physical security**

    - Is there a maintenance access interface? - AS07.11-AS07.13, TE11.08.07

    - Are there any ventilation holes or slits? - AS07.20, AS07.25

    - Are there any removable covers/doors? - AS07.22, TE07.39.02, TE07.39.05, AS07.47, TE07.51.02, TE07.51.07, TE07.51.08, AS07.62, TE07.65.02, TE07.65.07, TE07.65.08

    - Are there tamper seals? - IG 7.3.A

    - Are there tamper seals applied by the module user?

    - Does the module implement EFP or EFT mechanisms?

  - **Non-invasive security**

    - None

  - **Sensitive security parameters management**

    - Does the module support input and/or output of SSPs or other sensitive data? - AS09.13, AS09.18, AS09.19

      - Are there plaintext keys, CSPs, or sensitive data output? - AS09.16-AS09.17

      - Does the module support manual/direct entry of SSPs? AS09.15, AS10.42-AS10.46, TE10.46.04

    - Is split knowledge utilized? - AS09.21, AS09.22, AS09.23

    - Is one-time programmable (OTP) memory used in the module? - IG 9.7.A

  - **Self-tests**

    - None

  - **Life-cycle assurance**

    - Are there any CVEs related to this module? - IG 11.A

  - **Mitigation of other attacks**

    - Is the module designed to mitigate other attacks?

  - **Approved security functions**

    - Are any non-NIST curves used? - IG C.A

TEs Impacted by Basic TE Filters
________________________________

To ensure a structured approach to TE filtering, it is necessary to categorize TEs based on the security level and module type. Table 6 presents a detailed breakdown of the TEs applicable to different security levels for software modules, illustrating how filtering criteria refine the validation scope. By segmenting TEs according to security requirements, this table helps streamline the testing process, ensuring that only the relevant test evidence is considered for a given module configuration. This targeted approach enhances efficiency while maintaining rigorous security standards.

We recognize that software implementations only support levels 1 and 2. However, Table 7 lists the Area 2 Cryptographic Module Specification TEs required from security level 1 through level 4, and Table 8 lists the Area 7 Physical Security TEs for all four security levels.

.. table:: Table 7 Area 2 TEs Filtered by Security Level for Software Modules

   +---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | **Sec Level** | **Applicable TEs**                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | **Non-Applicable TEs**                                                                                                                                                                                                                                                                                     | **TEs N/A due to Module Type**                                                                                                                                                                                                                                                                             |
   +===============+================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+============================================================================================================================================================================================================================================================================================================+============================================================================================================================================================================================================================================================================================================+
   | 1             | TE02.03.01, TE02.03.02, TE02.07.01, TE02.07.02, TE02.09.01, TE02.10.01, TE02.10.02, TE02.11.01, TE02.11.02, TE02.12.01, TE02.13.01, TE02.13.02, TE02.13.03, TE02.14.01, TE02.16.01, TE02.16.02, TE02.16.03, TE02.16.04, TE02.16.05, TE02.19.01, TE02.19.02, TE02.20.01, TE02.20.02, TE02.20.03, TE02.20.04, TE02.21.01, TE02.21.02, TE02.22.01, TE02.22.02, TE02.24.01, TE02.24.02, TE02.26.01, TE02.26.02, TE02.26.03, TE02.26.04, TE02.26.05, TE02.28.01, TE02.28.02, TE02.30.01, TE02.30.02 | TE02.15.01, TE02.15.02, TE02.15.03, TE02.15.04, TE02.15.05, TE02.15.06, TE02.15.07, TE02.15.08, TE02.15.09, TE02.15.10, TE02.15.11, TE02.15.12, TE02.15.13, TE02.15.14, TE02.17.01, TE02.17.02, TE02.17.03, TE02.17.04, TE02.17.05, TE02.17.06, TE02.17.07, TE02.17.08, TE02.17.09, TE02.17.10, TE02.18.01 | TE02.15.01, TE02.15.02, TE02.15.03, TE02.15.04, TE02.15.05, TE02.15.06, TE02.15.07, TE02.15.08, TE02.15.09, TE02.15.10, TE02.15.11, TE02.15.12, TE02.15.13, TE02.15.14, TE02.17.01, TE02.17.02, TE02.17.03, TE02.17.04, TE02.17.05, TE02.17.06, TE02.17.07, TE02.17.08, TE02.17.09, TE02.17.10, TE02.18.01 |
   +---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | 2             | TE02.03.01, TE02.03.02, TE02.07.01, TE02.07.02, TE02.09.01, TE02.10.01, TE02.10.02, TE02.11.01, TE02.11.02, TE02.12.01, TE02.13.01, TE02.13.02, TE02.13.03, TE02.14.01, TE02.16.01, TE02.16.02, TE02.16.03, TE02.16.04, TE02.16.05, TE02.19.01, TE02.19.02, TE02.20.01, TE02.20.02, TE02.20.03, TE02.20.04, TE02.21.01, TE02.21.02, TE02.22.01, TE02.22.02, TE02.24.01, TE02.24.02, TE02.26.01, TE02.26.02, TE02.26.03, TE02.26.04, TE02.26.05, TE02.28.01, TE02.28.02, TE02.30.01, TE02.30.02 | TE02.15.01, TE02.15.02, TE02.15.03, TE02.15.04, TE02.15.05, TE02.15.06, TE02.15.07, TE02.15.08, TE02.15.09, TE02.15.10, TE02.15.11, TE02.15.12, TE02.15.13, TE02.15.14, TE02.17.01, TE02.17.02, TE02.17.03, TE02.17.04, TE02.17.05, TE02.17.06, TE02.17.07, TE02.17.08, TE02.17.09, TE02.17.10, TE02.18.01 | TE02.15.01, TE02.15.02, TE02.15.03, TE02.15.04, TE02.15.05, TE02.15.06, TE02.15.07, TE02.15.08, TE02.15.09, TE02.15.10, TE02.15.11, TE02.15.12, TE02.15.13, TE02.15.14, TE02.17.01, TE02.17.02, TE02.17.03, TE02.17.04, TE02.17.05, TE02.17.06, TE02.17.07, TE02.17.08, TE02.17.09, TE02.17.10, TE02.18.01 |
   +---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | 3             | TE02.03.01, TE02.03.02, TE02.07.01, TE02.07.02, TE02.09.01, TE02.10.01, TE02.10.02, TE02.11.01, TE02.11.02, TE02.12.01, TE02.13.01, TE02.13.02, TE02.13.03, TE02.14.01, TE02.16.01, TE02.16.02, TE02.16.03, TE02.16.04, TE02.16.05, TE02.19.01, TE02.19.02, TE02.20.01, TE02.20.02, TE02.20.03, TE02.20.04, TE02.21.01, TE02.21.02, TE02.22.01, TE02.22.02, TE02.24.01, TE02.24.02, TE02.26.01, TE02.26.02, TE02.26.03, TE02.26.04, TE02.26.05, TE02.28.01, TE02.28.02, TE02.30.01, TE02.30.02 | TE02.15.01, TE02.15.02, TE02.15.03, TE02.15.04, TE02.15.05, TE02.15.06, TE02.15.07, TE02.15.08, TE02.15.09, TE02.15.10, TE02.15.11, TE02.15.12, TE02.15.13, TE02.15.14, TE02.17.01, TE02.17.02, TE02.17.03, TE02.17.04, TE02.17.05, TE02.17.06, TE02.17.07, TE02.17.08, TE02.17.09, TE02.17.10, TE02.18.01 | TE02.15.01, TE02.15.02, TE02.15.03, TE02.15.04, TE02.15.05, TE02.15.06, TE02.15.07, TE02.15.08, TE02.15.09, TE02.15.10, TE02.15.11, TE02.15.12, TE02.15.13, TE02.15.14, TE02.17.01, TE02.17.02, TE02.17.03, TE02.17.04, TE02.17.05, TE02.17.06, TE02.17.07, TE02.17.08, TE02.17.09, TE02.17.10, TE02.18.01 |
   +---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | 4             | TE02.03.01, TE02.03.02, TE02.07.01, TE02.07.02, TE02.09.01, TE02.10.01, TE02.10.02, TE02.11.01, TE02.11.02, TE02.12.01, TE02.13.01, TE02.13.02, TE02.13.03, TE02.14.01, TE02.16.01, TE02.16.02, TE02.16.03, TE02.16.04, TE02.16.05, TE02.19.01, TE02.19.02, TE02.20.01, TE02.20.02, TE02.20.03, TE02.20.04, TE02.21.01, TE02.21.02, TE02.22.01, TE02.22.02, TE02.24.01, TE02.24.02, TE02.26.01, TE02.26.02, TE02.26.03, TE02.26.04, TE02.26.05, TE02.28.01, TE02.28.02, TE02.30.01, TE02.30.02 | TE02.15.01, TE02.15.02, TE02.15.03, TE02.15.04, TE02.15.05, TE02.15.06, TE02.15.07, TE02.15.08, TE02.15.09, TE02.15.10, TE02.15.11, TE02.15.12, TE02.15.13, TE02.15.14, TE02.17.01, TE02.17.02, TE02.17.03, TE02.17.04, TE02.17.05, TE02.17.06, TE02.17.07, TE02.17.08, TE02.17.09, TE02.17.10, TE02.18.01 | TE02.15.01, TE02.15.02, TE02.15.03, TE02.15.04, TE02.15.05, TE02.15.06, TE02.15.07, TE02.15.08, TE02.15.09, TE02.15.10, TE02.15.11, TE02.15.12, TE02.15.13, TE02.15.14, TE02.17.01, TE02.17.02, TE02.17.03, TE02.17.04, TE02.17.05, TE02.17.06, TE02.17.07, TE02.17.08, TE02.17.09, TE02.17.10, TE02.18.01 |
   +---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

While Table 7 focuses on the impact of TE filtering for software modules, the filtering criteria must also be applied to hardware-based implementations. Table 8 extends this analysis by examining TEs specific to single-chip hardware modules, mapping the applicable security requirements to different security levels. This comparison highlights the distinctions in validation approaches between software and hardware modules, ensuring that the filtering process remains consistent and comprehensive across various module types.

.. table:: Table 8 Area 7 TEs Filtered by Security Level for Single Chip Hardware Modules

   +-----------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Sec Level | Applicable TEs                                                                                                                                                                                                                                                                                                                                                                                                                                                         | Non-Applicable TEs                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | TEs N/A due to Module Type/Embodiment                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
   +===========+========================================================================================================================================================================================================================================================================================================================================================================================================================================================================+========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+
   | 1         | TE07.01.01, TE07.01.02, TE07.09.01, TE07.09.02, TE07.10.01, TE07.10.02, TE07.11.01, TE07.11.02, TE07.12.01, TE07.13.01, TE07.15.01, TE07.15.02                                                                                                                                                                                                                                                                                                                         | TE07.19.01, TE07.20.01, TE07.25.01, TE07.26.01, TE07.26.02, TE07.27.01, TE07.32.01, TE07.33.01, TE07.35.01, TE07.37.01, TE07.37.02, TE07.37.03, TE07.39.01, TE07.39.02, TE07.39.03, TE07.39.04, TE07.39.05, TE07.39.06, TE07.41.01, TE07.41.02, TE07.42.01, TE07.42.02, TE07.43.01, TE07.44.01, TE07.45.01, TE07.45.02, TE07.46.01, TE07.47.01, TE07.47.02, TE07.48.01, TE07.48.02, TE07.50.01, TE07.50.02, TE07.50.03, TE07.51.01, TE07.51.02, TE07.51.03, TE07.51.04, TE07.51.05, TE07.51.06, TE07.51.07, TE07.51.08, TE07.51.09, TE07.53.01, TE07.55.01, TE07.57.01, TE07.58.01, TE07.60.01, TE07.62.01, TE07.63.01, TE07.65.01, TE07.65.02, TE07.65.03, TE07.65.04, TE07.65.05, TE07.65.06, TE07.65.07, TE07.65.08, TE07.65.09, TE07.67.01, TE07.71.01, TE07.71.02, TE07.73.01, TE07.77.01, TE07.77.02, TE07.77.03, TE07.77.04, TE07.81.01, TE07.81.02, TE07.81.03 | TE07.43.01, TE07.60.01                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
   +-----------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | 2         | TE07.01.01, TE07.01.02, TE07.09.01, TE07.09.02, TE07.10.01, TE07.10.02, TE07.11.01, TE07.11.02, TE07.12.01, TE07.13.01, TE07.15.01, TE07.15.02, TE07.19.01, TE07.20.01, TE07.35.01                                                                                                                                                                                                                                                                                     | TE07.25.01, TE07.26.01, TE07.26.02, TE07.27.01, TE07.32.01, TE07.33.01, TE07.37.01, TE07.37.02, TE07.37.03, TE07.39.01, TE07.39.02, TE07.39.03, TE07.39.04, TE07.39.05, TE07.39.06, TE07.41.01, TE07.41.02, TE07.42.01, TE07.42.02, TE07.43.01, TE07.44.01, TE07.45.01, TE07.45.02, TE07.46.01, TE07.47.01, TE07.47.02, TE07.48.01, TE07.48.02, TE07.50.01, TE07.50.02, TE07.50.03, TE07.51.01, TE07.51.02, TE07.51.03, TE07.51.04, TE07.51.05, TE07.51.06, TE07.51.07, TE07.51.08, TE07.51.09, TE07.53.01, TE07.55.01, TE07.57.01, TE07.58.01, TE07.60.01, TE07.62.01, TE07.63.01, TE07.65.01, TE07.65.02, TE07.65.03, TE07.65.04, TE07.65.05, TE07.65.06, TE07.65.07, TE07.65.08, TE07.65.09, TE07.67.01, TE07.71.01, TE07.71.02, TE07.73.01, TE07.77.01, TE07.77.02, TE07.77.03, TE07.77.04, TE07.81.01, TE07.81.02, TE07.81.03                                     | TE07.43.01, TE07.44.01, TE07.45.01, TE07.45.02, TE07.46.01, TE07.47.01, TE07.47.02, TE07.48.01, TE07.48.02, TE07.60.01, TE07.62.01, TE07.63.01                                                                                                                                                                                                                                                                                                                                                 |
   +-----------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | 3         | TE07.01.01, TE07.01.02, TE07.09.01, TE07.09.02, TE07.10.01, TE07.10.02, TE07.11.01, TE07.11.02, TE07.12.01, TE07.13.01, TE07.15.01, TE07.15.02, TE07.19.01, TE07.20.01, TE07.25.01, TE07.26.01, TE07.26.02, TE07.27.01, TE07.35.01, TE07.37.01, TE07.37.02, TE07.37.03, TE07.39.01, TE07.39.02, TE07.39.03, TE07.39.04, TE07.39.05, TE07.39.06, TE07.73.01, TE07.77.01, TE07.77.02, TE07.77.03, TE07.77.04, TE07.81.01, TE07.81.02, TE07.81.03                         | TE07.32.01, TE07.33.01, TE07.41.01, TE07.41.02, TE07.42.01, TE07.42.02, TE07.43.01, TE07.44.01, TE07.45.01, TE07.45.02, TE07.46.01, TE07.47.01, TE07.47.02, TE07.48.01, TE07.48.02, TE07.50.01, TE07.50.02, TE07.50.03, TE07.51.01, TE07.51.02, TE07.51.03, TE07.51.04, TE07.51.05, TE07.51.06, TE07.51.07, TE07.51.08, TE07.51.09, TE07.53.01, TE07.55.01, TE07.57.01, TE07.58.01, TE07.60.01, TE07.62.01, TE07.63.01, TE07.65.01, TE07.65.02, TE07.65.03, TE07.65.04, TE07.65.05, TE07.65.06, TE07.65.07, TE07.65.08, TE07.65.09, TE07.67.01, TE07.71.01, TE07.71.02                                                                                                                                                                                                                                                                                                 | TE07.43.01, TE07.44.01, TE07.45.01, TE07.45.02, TE07.46.01, TE07.47.01, TE07.47.02, TE07.48.01, TE07.48.02, TE07.50.01, TE07.50.02, TE07.50.03, TE07.51.01, TE07.51.02, TE07.51.03, TE07.51.04, TE07.51.05, TE07.51.06, TE07.51.07, TE07.51.08, TE07.51.09, TE07.60.01, TE07.62.01, TE07.63.01, TE07.65.01, TE07.65.02, TE07.65.03, TE07.65.04, TE07.65.05, TE07.65.06, TE07.65.07, TE07.65.08, TE07.65.09                                                                                     |
   +-----------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | 4         | TE07.01.01, TE07.01.02, TE07.09.01, TE07.09.02, TE07.10.01, TE07.10.02, TE07.11.01, TE07.11.02, TE07.12.01, TE07.13.01, TE07.15.01, TE07.15.02, TE07.19.01, TE07.20.01, TE07.25.01, TE07.26.01, TE07.26.02, TE07.27.01, TE07.32.01, TE07.33.01, TE07.35.01, TE07.37.01, TE07.37.02, TE07.37.03, TE07.39.01, TE07.39.02, TE07.39.03, TE07.39.04, TE07.39.05, TE07.39.06, TE07.41.01, TE07.41.02, TE07.42.01, TE07.42.02, TE07.77.01, TE07.77.02, TE07.77.03, TE07.77.04 | TE07.43.01, TE07.44.01, TE07.45.01, TE07.45.02, TE07.46.01, TE07.47.01, TE07.47.02, TE07.48.01, TE07.48.02, TE07.50.01, TE07.50.02, TE07.50.03, TE07.51.01, TE07.51.02, TE07.51.03, TE07.51.04, TE07.51.05, TE07.51.06, TE07.51.07, TE07.51.08, TE07.51.09, TE07.53.01, TE07.55.01, TE07.57.01, TE07.58.01, TE07.60.01, TE07.62.01, TE07.63.01, TE07.65.01, TE07.65.02, TE07.65.03, TE07.65.04, TE07.65.05, TE07.65.06, TE07.65.07, TE07.65.08, TE07.65.09, TE07.67.01, TE07.71.01, TE07.71.02, TE07.73.01, TE07.81.01, TE07.81.02, TE07.81.03                                                                                                                                                                                                                                                                                                                         | TE07.43.01, TE07.44.01, TE07.45.01, TE07.45.02, TE07.46.01, TE07.47.01, TE07.47.02, TE07.48.01, TE07.48.02, TE07.50.01, TE07.50.02, TE07.50.03, TE07.51.01, TE07.51.02, TE07.51.03, TE07.51.04, TE07.51.05, TE07.51.06, TE07.51.07, TE07.51.08, TE07.51.09, TE07.53.01, TE07.55.01, TE07.57.01, TE07.58.01, TE07.60.01, TE07.62.01, TE07.63.01, TE07.65.01, TE07.65.02, TE07.65.03, TE07.65.04, TE07.65.05, TE07.65.06, TE07.65.07, TE07.65.08, TE07.65.09, TE07.67.01, TE07.71.01, TE07.71.02 |
   +-----------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

TE Impacted by Supplemental TE Filters
______________________________________

In addition to the basic TE filtering criteria, supplemental filters further refine the selection of applicable test evidence based on specific module properties and security features. Table 9 highlights the TEs affected by these supplemental filtering properties, which include factors such as authentication mechanisms, cryptographic output capabilities, tamper response measures, and other specialized security attributes. By applying these filters, the validation process can be optimized to focus on the most relevant security assurances while reducing redundant or inapplicable tests. This targeted approach enhances the efficiency and accuracy of the TE selection process.

.. table:: Table 9 TEs Affected by the Supplemental Filtering Properties

   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Filter Property**                            | **Include If True**      | **Exclude If False**                                                                                                                                                                                                                                                                                                                                       | **Number of Affected TEs** |
   +================================================+==========================+============================================================================================================================================================================================================================================================================================================================================================+============================+
   | **Has Excluded Components**                    |                          | TE02.13.01, TE02.13.02, TE02.13.03, TE02.14.01, TE02.15.05, TE02.16.04, TE02.17.04                                                                                                                                                                                                                                                                         | 7                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Has EFP**                                    |                          | TE07.77.01, TE07.77.02, TE07.77.03, TE07.77.04                                                                                                                                                                                                                                                                                                             | 4                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Uses Split Knowledge**                       |                          | TE09.21.01, TE09.21.02, TE09.21.03, TE09.21.04, TE09.22.01, TE09.23.01, TE09.23.02, TE09.23.04, TE09.24.01                                                                                                                                                                                                                                                 | 9                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Allows Self-Initiated Cryptographic Output** |                          | TE04.23.01, TE04.25.01, TE04.25.02, TE04.25.03                                                                                                                                                                                                                                                                                                             | 4                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Supports Bypass Capability**                 |                          | TE04.18.01, TE04.19.01, TE04.19.02, TE04.19.03, TE04.20.01, TE04.20.02, TE04.20.03, TE04.21.01, TE04.21.02, TE04.22.01, TE04.22.02, TE10.21.01, TE10.21.02, TE10.21.03, TE10.21.04, TE10.22.01, TE10.22.02, TE10.22.03, TE10.22.04, TE10.22.05, TE10.48.01, TE10.48.02, TE10.48.03, TE10.49.01, TE10.49.02, TE10.49.03, TE10.51.01, TE10.51.02, TE10.51.03 | 29                         |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Has Identity-Based Authentication**          |                          | TE03.20.01, TE04.39.01, TE04.39.02, TE04.39.03, TE04.39.04, TE04.42.01, TE04.42.02, TE04.42.03, TE04.42.04, TE09.22.01                                                                                                                                                                                                                                     | 10                         |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Provides Maintenance Access Interface**      | TE07.50.03               | TE07.11.01, TE07.11.02, TE07.12.01, TE07.13.01, TE07.51.07, TE07.51.08, TE07.65.02, TE07.65.07, TE07.65.08, TE11.08.07                                                                                                                                                                                                                                     | 11                         |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Uses EDC**                                   |                          | TE05.06.02, TE05.07.01                                                                                                                                                                                                                                                                                                                                     | 2                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Supports Manual SSP Entry**                  |                          | TE09.14.01, TE09.14.02, TE10.46.01, TE10.46.02, TE10.46.03, TE10.46.04                                                                                                                                                                                                                                                                                     | 6                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Supports Concurrent Operators**              |                          | TE04.02.01, TE04.02.02, TE04.02.03                                                                                                                                                                                                                                                                                                                         | 3                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Supports Software Firmware Loading**         |                          | TE04.28.01, TE04.29.01, TE04.32.01, TE04.34.01, TE05.13.01, TE05.13.02, TE05.13.03, TE05.13.04, TE05.13.05, TE05.13.06, TE05.13.07, TE05.13.08                                                                                                                                                                                                             | 12                         |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Supports Complete Image Replacement**        |                          | TE04.33.01, TE04.35.01, TE04.35.02                                                                                                                                                                                                                                                                                                                         | 3                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Uses Hash MAC Integrity**                    |                          | TE05.05.03                                                                                                                                                                                                                                                                                                                                                 | 1                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Has Control Output**                         |                          | TE03.09.01, TE03.09.02, TE03.10.01, TE03.10.02, TE03.10.03, TE03.10.04, TE03.10.05                                                                                                                                                                                                                                                                         | 7                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Has Ventilation or Slits**                   |                          | TE07.20.01, TE07.25.01                                                                                                                                                                                                                                                                                                                                     | 2                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Has EDC**                                    |                          | TE10.46.02, TE10.46.03                                                                                                                                                                                                                                                                                                                                     | 2                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Has External Input Device**                  |                          | TE03.05.02, TE03.08.02                                                                                                                                                                                                                                                                                                                                     | 2                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Has User Role**                              |                          | TE04.06.01                                                                                                                                                                                                                                                                                                                                                 | 1                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Has External Output Device**                 |                          | TE03.06.02, TE03.11.02                                                                                                                                                                                                                                                                                                                                     | 2                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Has Removable Cover**                        | TE07.50.03               | TE07.13.01, TE07.20.01, TE07.25.01, TE07.39.02, TE07.39.05, TE07.47.01, TE07.47.02, TE07.48.01, TE07.48.02, TE07.51.02, TE07.51.07, TE07.51.08, TE07.62.01, TE07.63.01, TE07.65.02, TE07.65.07, TE07.65.08                                                                                                                                                 | 18                         |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Outputs Sensitive Data as Plaintext**        |                          | TE09.16.01, TE09.16.02, TE09.16.03                                                                                                                                                                                                                                                                                                                         | 3                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Has Critical Functions**                     |                          | TE10.24.01, TE10.24.02                                                                                                                                                                                                                                                                                                                                     | 2                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Uses Authentication**                        |                          | TE04.43.01, TE04.43.02, TE04.44.01, TE04.44.02, TE04.45.01, TE04.45.02, TE04.45.03, TE04.47.01, TE04.48.01, TE04.50.01, TE04.50.02, TE04.51.01, TE04.51.02, TE04.52.01, TE04.53.01, TE04.54.01, TE04.54.02, TE04.54.03, TE04.55.01, TE04.55.02                                                                                                             | 20                         |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Uses Role-Based Authentication**             |                          | TE04.37.01, TE04.37.02, TE04.38.01, TE04.38.02                                                                                                                                                                                                                                                                                                             | 4                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Has Default Authentication Data**            |                          | TE04.45.03                                                                                                                                                                                                                                                                                                                                                 | 1                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Has Degraded Mode**                          |                          | TE02.26.01, TE02.26.02, TE02.26.03, TE02.26.04, TE02.26.05, TE02.28.01, TE02.28.02, TE02.30.01, TE02.30.02                                                                                                                                                                                                                                                 | 9                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Has EFT**                                    |                          | TE07.81.01, TE07.81.02, TE07.81.03                                                                                                                                                                                                                                                                                                                         | 3                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Has Trusted Channel**                        |                          | TE03.16.01, TE03.18.01, TE03.18.02, TE03.19.01, TE03.19.02, TE03.19.03, TE03.19.04, TE03.20.01, TE03.21.01, TE03.22.01, TE09.21.01, TE09.21.04                                                                                                                                                                                                             | 12                         |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Uses Multi-Factor Authentication**           |                          | TE04.59.01, TE09.24.01, TE09.24.02                                                                                                                                                                                                                                                                                                                         | 3                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Allows Operator to Change Roles**            |                          | TE04.38.01, TE04.38.02, TE04.42.01, TE04.42.02, TE04.42.03, TE04.42.04                                                                                                                                                                                                                                                                                     | 6                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Uses Digital Signature Integrity**           |                          | TE05.05.04                                                                                                                                                                                                                                                                                                                                                 | 1                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Has Maintenance Role**                       |                          | TE04.07.01, TE04.07.02, TE04.07.03                                                                                                                                                                                                                                                                                                                         | 3                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Has Additional Mitigations**                 |                          | TE12.01.01, TE12.02.01, TE12.04.01, TE12.04.02, TE12.04.03                                                                                                                                                                                                                                                                                                 | 5                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Supports Sensitive Data I/O**                |                          | TE09.13.01, TE09.13.02, TE09.13.03, TE09.18.01, TE09.18.02, TE09.19.01                                                                                                                                                                                                                                                                                     | 6                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Has Tamper Seals**                           |                          | TE07.27.01, TE07.48.01, TE07.48.02, TE07.63.01                                                                                                                                                                                                                                                                                                             | 4                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Has CVE**                                    |                          | TE11.38.03                                                                                                                                                                                                                                                                                                                                                 | 1                          |
   +------------------------------------------------+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+
   | **Total number of TEs affected by the supplemental filter properties**                                                                                                                                                                                                                                                                                                                                                                 | **192**                    |
   +----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------+

Note: The total number of the TEs affected by the supplemental filter properties is not the sum of the numbers in the column of "Number of Affected TEs" (i.e., 218) because some TEs are affected by multiple filter properties and so appear multiple times in **Table 9**.

Removing ASes not separately tested
-----------------------------------

Some assertions (ASes) are “not separately tested”, as indicated in ISO/IEC 24759 :ref:`[3] <ref-3>` and they do not have associated TEs.

These ASes depend on the completion of other ASes and their TEs. For example, **AS05.22** is not separately tested but is instead tested as part of **AS05.05**. Table 10 highlights ASes that are not separately tested. Since these ASes are conditional in nature, a solution to the problem of these assertions that could be utilized is to use these assertions to further automate the report writing process. In this instance, the AS that is not separately tested could be omitted from the report template provided by the NCCoE ACMVP server if the server will include ASes in addition to TEs.

The TE Workstream does not address the dependency at the TE level (e.g., TE10.28.02 and TE10.34.03) as opposed to the AS level.

.. table:: Table 10 Assertions (ASes) not separately tested

   +-----------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | **FIPS 140-3 Section Title**            | **ASes not separately tested**                                                                                                                                                                                                                                                                                                                                                                                                        |
   +=========================================+=======================================================================================================================================================================================================================================================================================================================================================================================================================================+
   | General                                 | N/A                                                                                                                                                                                                                                                                                                                                                                                                                                   |
   +-----------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Cryptographic Module Specification      | AS02.01, AS02.02, AS02.04, AS02.05, AS02.06, AS02.08, AS02.25, AS02.26, AS02.29, AS02.31, AS02.32                                                                                                                                                                                                                                                                                                                                     |
   +-----------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Cryptographic Module Interfaces         | AS03.12, AS03.17                                                                                                                                                                                                                                                                                                                                                                                                                      |
   +-----------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Roles, Services, and Authentication     | AS04.01, AS04.05, AS04.08, AS04.09, AS04.10, AS04.12, AS04.16, AS04.17, AS04.24, AS04.26, AS04.27, AS04.30, AS04.31, AS04.36, AS04.40, AS04.41, AS04.46, AS04.49, AS04.57, AS04.58                                                                                                                                                                                                                                                    |
   +-----------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Software/Firmware Security              | AS05.01, AS05.03, AS05.09, AS05.10, AS05.14, AS05.18, AS05.19, AS05.21, AS05.22                                                                                                                                                                                                                                                                                                                                                       |
   +-----------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Operational Environment                 | AS06.01, AS06.02, AS06.04, AS06.09, AS06.16, AS06.21, AS06.22, AS06.23, AS06.29                                                                                                                                                                                                                                                                                                                                                       |
   +-----------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Physical Security                       | AS07.02, AS07.03, AS07.04, AS07.05, AS07.06, AS07.07, AS07.08, AS07.14, AS07.16, AS07.17, AS07.18, AS07.21, AS07.22, AS07.23, AS07.24, AS07.28, AS07.29, AS07.30, AS07.31, AS07.34, AS07.36, AS07.38, AS07.40, AS07.49, AS07.52, AS07.54, AS07.56, AS07.59, AS07.61, AS07.64, AS07.66, AS07.68, AS07.69, AS07.70, AS07.72, AS07.74, AS07.75, AS07.76, AS07.78, AS07.79, AS07.80, AS07.81, AS07.82, AS07.83, AS07.84, AS07.85, AS07.86 |
   +-----------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Non-Invasive Security                   | N/A                                                                                                                                                                                                                                                                                                                                                                                                                                   |
   +-----------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Sensitive Security Parameter Management | AS09.11, AS09.12, AS09.15, AS09.17, AS09.20, AS09.26, AS09.30, AS09.34, AS09.35                                                                                                                                                                                                                                                                                                                                                       |
   +-----------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Self-Tests                              | AS10.01, AS10.02, AS10.03, AS10.04, AS10.05, AS10.06, AS10.13, AS10.14, AS10.16, AS10.17, AS10.18, AS10.19, AS10.23, AS10.26, AS10.30, AS10.31, AS10.32, AS10.32, AS10.36, AS10.38, AS10.39, AS10.40, AS10.41, AS10.42, AS10.43, AS10.44, AS10.45, AS10.47, AS10.50, AS10.52, AS10.55                                                                                                                                                 |
   +-----------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Life-Cycle Assurance                    | AS11.02, AS11.07, AS11.09, AS11.10, AS11.12, AS11.14, AS11.20, AS11.22, AS11.27                                                                                                                                                                                                                                                                                                                                                       |
   +-----------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Mitigation of Other Attacks             | None                                                                                                                                                                                                                                                                                                                                                                                                                                  |
   +-----------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
