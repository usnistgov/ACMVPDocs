.. raw:: html

    <style> .gray {color:gray} </style>

.. role :: gray

Appendix A. Technical Details from the Test Evidence (TE) Workstream
====================================================================

The rest of this report provides additional technical details from the Test Evidence (TE) Workstream:

1. `TEs Requiring Vendor Documentation section <A.1. TEs Requiring Vendor Documentation_>`_: categories and sub-categories of TEs based on reviewing the Security Policy (SP) or other vendor documentation

2. `TEs Requiring Module Functional Test section <A.2. TEs Requiring Module Functional Test_>`_: TEs based on exercising/executing the module to test its functionality

3. `Complete List of TEs section <A.3. Complete List of TEs_>`_: a complete list of TEs, each tagged by category

A.1. TEs Requiring Vendor Documentation
=======================================

The required documentation for a Federal Information Processing Standards (FIPS) validation is specified in NIST Special Publication 800-140A, which modifies the vendor documentation requirements of ISO/IEC 19790 Annex A. Hereafter, the vendor-documentation-dependent TEs will be indicated as **140A-TE**\ s. Those TEs require the tester to verify the presence and accuracy of information within the vendor documentation or to verify statements based on information from the documentation.

The overall category of 140A-TEs, as opposed to the TEs depending on functional tests (hereafter **FT-TE**\ s), is relatively clear. They are indicated by the keyword “verify” as in the following examples:

1. “verify the name and version as indicated in AS04.13” (e.g., TE04.33.01)

2. "verify the vendor documentation" (e.g., TE04.05.01)

3. "verify that the vendor provided documentation" (e.g., TE05.05.01)

4. "verify, by inspection and from the vendor documentation" (e.g., TE05.15.01)

5. "verify the vendor documentation, and by inspection" (e.g., TE06.10.01), "verify by inspection, or from the vendor documentation" (e.g., TE07.15.01)

6. "verify … as documented" (e.g., TE07.27.01)

7. "verify … are documented" (e.g., TE07.33.01)

8. "verify the vendor documentation shows … " (e.g., TE10.09.01)

9. "verify … through the procedure documented in …" (e.g., TE10.11.01)

The 140A-TEs may or may not depend on the SP. They may depend on source code or other proprietary documentation. So, the **140A-TE**\ s can be further divided into three sub-categories as they relate to Security Policy (SP), Source Code (SC), and Other Documents (OD):

1. **SP-TE**\ s: TEs depend on the information provided by the public-facing SP. NIST Special Publication 800-140Br1 is to be used in conjunction with ISO/IEC 19790 Annex B and ISO/IEC 24759 section 6.14. It also specifies the order of the SP. Some TEs explicitly identify the source of the vendor documentation in the SP. Ideally, Special Publication 800-140Br1 should require the SP to include all information to satisfy the SP-dependent TEs.

2. **SC-TE**\ s: TEs require source code review. It may not be intuitive that source code falls under vendor documentation. There are TEs that explicitly require code review or actual source code, verify some statement by (code) inspection, or verify *how* the specification is implemented. Source code handling often requires special care and attention. Therefore, we separate these SC-TEs from the TEs that depend on other vendor documentation.

3. **OD-TE**\ s: If a 140A-TE is neither an SP-TE nor an SC-TE, we designate it as an OD-TE, meaning the TE depends on an *O*\ ther *D*\ ocument such as a Finite State Model (FSM), Component List (CL), design document, user guidance, or configuration management manual.

Here are some examples:

1. SP-TEs: 140B requires the SP to provide the information

   1. TE04.47.01: *The tester shall verify that the security functions used to authenticate operators are all approved security functions.*

   2. TE04.48.01: *The tester shall verify that the authentication mechanism used to authenticate operators is an approved one.*

2. SC-TEs: TEs that depend on source code inspection

   1. TE03.07.05: *The tester shall verify that the vendor documentation specifies how the cryptographic module ensures that all data output via the data output interface is to be inhibited during error states or self-test conditions. The tester shall also verify, by inspection of the design of the cryptographic module, that the data output interface is, in fact, logically or physically inhibited under these conditions.*

   2. TE03.15.05: *The tester shall examine the applicable source code(s) to ensure that the identified component is actually validating the documented format.*

3. OD-TEs: requires rationale of correctness, FSM or SW/FW CL

   1. TE03.19.03: *The tester shall verify the correctness of any rationale provided by the vendor. The burden of proof is on the vendor; if there is any uncertainty or ambiguity, the tester shall require the vendor to produce additional information as needed.*

   2. TE11.08.01: *The tester shall verify that the vendor has provided a description of the finite state model. This description shall contain the identification and description of all states of the module and a description of all corresponding state transitions. The tester shall verify that the descriptions of the state transitions include the internal module conditions, data inputs and control inputs that cause transitions from one state to another, data outputs and status outputs resulting from transitions from one state to another.*

   3. TE11.16.01: *The tester shall use the list supplied by the vendor to verify that a source listing for each software or firmware component is contained in the module.*

Let us look at an example TE that is assessed by reviewing the vendor documentation, and this TE's associated AS and VE.

**AS05.02** states, “The documentation requirements specified in {ISO/IEC 19790:2012} A.2.5 shall be provided.” Following that, **VE05.02.01** states, “The vendor shall provide documentation as specified in ISO/IEC 19790:2012, A.2.5.” Lastly, the **TE05.02.01** for this section states, “The tester shall verify completeness of the documentation specified in ISO/IEC 19790:2012, A.2.5.”

To fulfill **TE05.02.01**, the tester needs to check the documentation provided by the vendor and verify that it is present and complete. The example illustrates a documentation-type TE (i.e. 140A-TE). TEs of this type are ripe for automation because they only rely on checking for the presence of appropriate texts. The accuracy of the information provided for these TEs is later verified by subsequent tests and documentation reviews done during Functional Testing, Source Code Review, and Module Inspection.

By exploring the relationship between VEs and TEs, it becomes apparent that if some VEs were in the form of a standardized SP, their corresponding TEs could be verified through automation. The NIST CMVP updated Special Publication 800-140B to specify the expected content of the SP and provide an SP template for all vendors and labs to use; Revision 1 was published in November 2023.

The current NIST Web CRYPTIK Br1 v1.0.3 has built-in Module Information Structure (MIS) Tables and a search capability to look up and select Cryptographic Algorithm Validation Program (CAVP) certificates. The completed MIS Tables can be saved as a JSON file and be combined with other information in an SP Microsoft Word template to build the final SP.

This TE WS is exploring an alternative method to generate the SP purely via JSON rather than implementing a hybrid approach that requires an SP Microsoft Word template to build the final SP\ [STRIKEOUT:.] Following the CMVP's current SP Template v5.8, the NCCoE TE WS has developed an SP-evidence JSON file to satisfy all SP-TEs. The NCCoE Research Infrastructure WS is implementing the functionality on the ACMVP server for generating an SP in a PDF file based on the input SP-evidence JSON file. This functionality will be demoed at the ICMC24.

Under the assumptions that the SP strictly follows Special Publication 800-140Br1 and that the required SP content is captured in MIS Tables or the other data entries in the SP-evidence JSON file, all SP-TEs can reference the relevant data points in the SP-evidence JSON file. The existence of the reference can be automatically checked. If the reference exists, the corresponding TE passes.

SP-TEs must be satisfied by the information provided by the SP as specified in NIST Special Publication 800-140Br1, which we denote as **140B-TEs**. 140B-TEs is a subset of SP-TEs because a vendor may choose to include more information in the SP as required by Special Publication 800-140Br1.

Furthermore, to maximize automation, all data points necessary to satisfy 140A-TEs should be captured in a standardized documentation-evidence JSON. This work needs to be incorporated and elaborated in the TE Evidence Catalog.

Table 1 lists all of the TEs depending on the SP, regardless of whether the TE explicitly indicates the source of the vendor document to be the SP or whether Special Publication 800-140Br1 requires it, in column **SP-TEs**. The **non-140B-but-140A-TEs** column is not intended to duplicate the TEs from the SP-TEs column, but instead to capture all other TEs that depend on vendor documentation, which could be SP, source code, FSM, CL, design document, or other vendor proprietary documentation. For cases where the information needs to be in the SP and verified by (code) inspection or design document, the TEs (e.g., TE02.07.02) are listed under both columns, despite the duplication.

TEs depending on source code review or inspection are a subset of the non-140B-but-140A-TEs column in the table. Some TEs have the explicit wording of “code” or “source code,” while others imply it via the phrase “by inspection” or “inspecting the module.” TEs requiring source code review are tagged as SC-TE in the `Complete List of TEs section <A.3. Complete List of TEs_>`_.

TEs requiring other documents are tagged as OD-TE in the `Complete List of TEs section <A.3. Complete List of TEs_>`_.

.. table:: Table 1 – Dividing 140A-TEs into non-140B-TEs and SP-TEs

   +--------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | **FIPS 140-3 Section Title**                                             | **140A-TEs**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |**140A-TEs**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
   +                                                                          +------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   |                                                                          | **non-140B-but-140A-TEs**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | **SP-TEs**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
   +==========================================================================+================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+
   | General                                                                  | None                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | None                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
   +--------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Cryptographic Module Specification                                       | TE02.03.02, TE02.07.01, TE02.07.02 (also SP-TE), TE02.10.01 (also SP-TE), TE02.10.02, TE02.13.02, TE02.17.09                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | TE02.03.01, TE02.07.02, TE02.09.01, TE02.10.01, TE02.11.01, TE02.11.02, TE02.12.01, TE02.13.01, TE02.14.01, TE02.15.01, TE02.15.02, TE02.15.04, TE02.15.06, TE02.15.07, TE02.15.08, TE02.15.09, TE02.15.10, TE02.15.11, TE02.15.12, TE02.15.13, TE02.15.14, TE02.16.01, TE02.16.02, TE02.16.03, TE02.16.05, TE02.17.01, TE02.17.02, TE02.17.03, TE02.17.05, TE02.17.06, TE02.17.07, TE02.17.08, TE02.17.10, TE02.18.01, TE02.19.01, TE02.20.01, TE02.20.02, TE02.20.03, TE02.20.04, TE02.21.01, TE02.21.02, TE02.22.01, TE02.24.01, TE02.26.01, TE02.26.02, TE02.30.01 |
   +--------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Cryptographic Module Interfaces                                          | TE03.01.02 (also SP-TE), TE03.02.01, TE03.05.02, TE03.06.02, TE03.07.01, TE03.07.03, TE03.07.05, TE03.07.06, TE03.07.07, TE03.08.02, TE03.09.01, TE03.10.01, TE03.10.03, TE03.10.05, TE03.11.02, TE03.13.01, TE03.14.01, TE03.14.02, TE03.14.03, TE03.15.01, TE03.15.02, TE03.15.05, TE03.16.01, TE03.18.01, TE03.19.01, TE03.19.03                                                                                                                                                                                                                                                            | TE03.01.01, TE03.01.02, TE03.01.03, TE03.02.02, TE03.03,01, TE03.04.01,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
   +--------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Roles, Services, and Authentication                                      | TE04.02.01, TE04.03.01, TE04.07.01, TE04.07.02, TE04.19.01, TE04.20.01, TE04.20.02, TE04.21.01, TE04.22.01, TE04.25.01, TE04.33.01, TE04.35.01, TE04.38.01, TE04.39.01, TE04.42.01, TE04.42.02, TE04.43.01, TE04.44.01, TE04.45.01, TE04.51.02, TE04.53.01, TE04.54.01, TE04.55.01                                                                                                                                                                                                                                                                                                             | TE04.05.01, TE04.06.01, TE04.11.01, TE04.13.02, TE04.14.01, TE04.18.01, TE04.37.01, TE04.47.01, TE04.48.01, TE04.50.01, TE04.50.02, TE04.51.01, TE04.56.01, TE04.56.02, TE04.59.01                                                                                                                                                                                                                                                                                                                                                                                     |
   +--------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Software/Firmware Security                                               | TE05.02.01, TE05.04.01, TE05.05.01, TE05.05.03, TE05.05.04, TE05.05.06, TE05.06.01, TE05.06.05, TE05.07.01, TE05.08.02, TE05.11.01, TE05.12.01, TE05.12.02, TE05.13.01, TE05.13.02, TE05.13.04, TE05.13.06, TE05.13.07, TE05.15.01, TE05.15.02, TE05.16.01, TE05.16.02, TE05.20.01, TE05.23.01                                                                                                                                                                                                                                                                                                 | TE05.05.02, TE05.17.01                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
   +--------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Operational Environment                                                  | TE06.03.01, TE06.05.01, TE06.05.02, TE06.06.01, TE06.08.01, TE06.08.02, TE06.10.01, TE06.11.01, TE06.12.01, TE06.13.01, TE06.14.01, TE06.15.01, TE06.17.01, TE06.18.01, TE06.19.01, TE06.24.01, TE06.25.01, TE06.26.01, TE06.27.01, TE06.28.01                                                                                                                                                                                                                                                                                                                                                 | TE06.07.01, TE06.09.01, TE06.20.01                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
   +--------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Physical Security                                                        | TE07.10.01, TE07.11.01, TE07.12.01, TE07.15.01, TE07.15.02, TE07.19.01, TE07.20.01, TE07.25.01, TE07.26.01, TE07.33.01, TE07.35.01, TE07.37.01, TE07.37.02, TE07.39.01, TE07.39.02, TE07.39.03, TE07.39.04, TE07.41.01, TE07.42.01, TE07.43.01, TE07.44.01, TE07.45.01, TE07.46.01, TE07.47.01, TE07.48.01, TE07.50.01, TE07.50.02, TE07.50.03, TE07.51.01, TE07.51.02, TE07.51.03, TE07.51.04, TE07.51.05, TE07.51.07, TE07.53.01, TE07.55.01, TE07.57.01, TE07.60.01, TE07.65.01, TE07.65.02, TE07.65.03, TE07.65.04, TE07.65.05, TE07.65.06, TE07.65.07, TE07.67.01, TE07.71.01, TE07.73.01 | TE07.01.01, TE07.09.01, TE07.09.02, TE07.19.01, TE07.26.02, TE07.77.04, TE07.81.03                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
   +--------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Non-Invasive Security                                                    | Not yet enforced by the CMVP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | Not yet enforced by the CMVP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
   +--------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Sensitive Security Parameter Management                                  | TE09.01.01, TE09.02.01, TE09.03.01, TE09.05.01, TE09.08.02, TE09.14.01, TE09.16.01, TE09.16.02, TE09.21.01, TE09.23.01, TE09.23.02, TE09.23.04, TE09.24.01, TE09.25.01, TE09.27.01, TE09.28.06, TE09.29.01, TE09.29.02, TE09.31.01, TE09.32.01, TE09.36.01                                                                                                                                                                                                                                                                                                                                     | TE09.04.01, TE09.04.02, TE09.06.01, TE09.06.02, TE09.06.03, TE09.07.01, TE09.08.01, TE09.09.01, TE09.09.02, TE09.10.01, TE09.10.02, TE09.13.01, TE09.13.02, TE09.19.01, TE09.22.01, TE09.28.01, TE09.28.05, TE09.33.01, TE09.37.01                                                                                                                                                                                                                                                                                                                                     |
   +--------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Self-Tests                                                               | TE10.12.01, TE10.12.02, TE10.15.01, TE10.15.02, TE10.20.01, TE10.21.01, TE10.21.02, TE10.22.02, TE10.22.03, TE10.22.05, TE10.27.01, TE10.28.01, TE10.29.01, TE10.33.02, TE10.34.02, TE10.35.01, TE10.35.02, TE10.35.03, TE10.37.03, TE10.37.04, TE10.37.07, TE10.37.08, TE10.46.01, TE10.46.02, TE10.48.02, TE10.49.02, TE10.51.01, TE10.51.02, TE10.51.03                                                                                                                                                                                                                                     | TE10.07.01, TE10.07.02, TE10.08.01, TE10.08.02, TE10.09.01, TE10.09.02, TE10.24.01, TE10.25.01, TE10.33.01, TE10.34.01, TE10.37.01, TE10.37.02, TE10.53.01                                                                                                                                                                                                                                                                                                                                                                                                             |
   +--------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Life-Cycle Assurance                                                     | TE11.01.01, TE11.03.01, TE11.04.01, TE11.04.02, TE11.04.03, TE11.04.04, TE11.05.01, TE11.06.01, TE11.08.01, TE11.08.02, TE11.08.03, TE11.08.04, TE11.08.05, TE11.08.07, TE11.08.08, TE11.08.10, TE11.08.11, TE11.08.12, TE11.13.01, TE11.15.01, TE11.15.02, TE11.16.01, TE11.17.01, TE11.18.01, TE11.19.01, TE11.21.01, TE11.23.01, TE11.24.01, TE11.25.01, TE11.26.01, TE11.28.01, TE11.28.02, TE11.28.03, TE11.29.01, TE11.29.02, TE11.30.01, TE11.31.01, TE11.33.01, TE11.34.01, TE11.38.03                                                                                                 | TE11.32.01, TE11.35.01, TE11.36.01, TE11.37.01, TE11.38.01, TE11.39.01                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
   +--------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Mitigation of Other Attacks                                              | TE12.01.01, TE12.04.02                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | TE12.02.01, TE12.04.01, TE12.04.03                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
   +--------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | NIST Special Publication 800-140A                                        | TEA01.01                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
   +--------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | NIST Special Publication 800-140B (Cryptographic module security policy) |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | TEB.01.01, TEB.02.01, TEB.03.01, TEB.03.02                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
   +--------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

A.2. TEs Requiring Module Functional Test 
=========================================

TEs in this category require the tester to exercise and manipulate the module to test its functionality. To do this, testers rely on various pieces of evidence that include log file names, screenshots, or remote testing/video observation. In essence: the tester must directly see and interact with the module to ensure that it functions in the way specified by the vendor.

**TE09.03.02** is an example of this category. It states: “For each Sensitive Security Parameter (SSP) that can be entered, the tester shall first enter the SSP while assuming the correct entity. The tester shall then verify that entry is not possible when assuming an incorrect entity.” To fulfill this TE, the tester must assume specific entities and use the module as those assumed roles, testing that the module correctly identifies roles and grants only the appropriate SSP entry service to each entity.

This category of TEs is the hardest to automate; however, we may address the work surrounding functional testing. Automation opportunities may be found in how the lab collects and prepares the test evidence (e.g., log files) from functional testing.

Table 2 lists all TEs that require functional testing at specific Security Levels (SLs).

.. table:: Table 2 - TEs Requiring Functional Testing

   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------+
   | **FIPS 140-3 Section Name**         | **TEs for SL 1-4**                                                                                                                                                                                                                                                                                                                                                                             | **TEs for SL 2-4**                                                                                                                                                                                                                                                                                                                                                                                                                                         | **TEs for SL 3-4**                                                                                                                                                                                                                                                                                         | **TEs for SL 4**                                                                                           |
   +=====================================+================================================================================================================================================================================================================================================================================================================================================================================================+============================================================================================================================================================================================================================================================================================================================================================================================================================================================+============================================================================================================================================================================================================================================================================================================+============================================================================================================+
   | General                             | N/A                                                                                                                                                                                                                                                                                                                                                                                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                            |                                                                                                                                                                                                                                                                                                            |                                                                                                            |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------+
   | Module Specification                | TE02.10.01 (or SC-TE), TE02.12.01, TE02.13.03, TE02.15.03, TE02.15.05, TE02.16.04, TE02.17.02, TE02.17.04, TE02.19.02, TE02.22.02, TE02.24.02, TE02.26.03, TE02.26.04, TE02.26.05, TE02.28.01, TE02.28.02, TE02.30.02                                                                                                                                                                          | None                                                                                                                                                                                                                                                                                                                                                                                                                                                       | None                                                                                                                                                                                                                                                                                                       | None                                                                                                       |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------+
   | Module Interfaces                   | TE03.01.04, TE03.02.01, TE03.05.01, TE03.05.02, TE03.06.01, TE03.06.02, TE03.07.02, TE03.07.04, TE03.07.08, TE03.08.01, TE03.08.02, TE03.09.02, TE03.10.02, TE03.10.04, TE03.11.01, TE03.11.03, TE03.13.02, TE03.14.03, TE03.15.02, TE03.15.03, TE03.15.04, TE03.15.06                                                                                                                         | None                                                                                                                                                                                                                                                                                                                                                                                                                                                       | TE03.16.01 (or SC-TE), TE03.18.01, TE03.18.02, TE03.19.02, TE03.19.04, TE03.20.01, TE03.21.01                                                                                                                                                                                                              | TE03.22.01                                                                                                 |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------+
   | Roles, Services, and Authentication | TE04.02.02, TE04.02.03, TE04.07.03, TE04.11.02, TE04.13.01, TE04.13.03, TE04.14.02, TE04.15.01, TE04.19.02, TE04.19.03, TE04.20.01, TE04.20.03, TE04.21.02, TE04.22.02, TE04.23.01, TE04.25.02, TE04.25.03, TE04.28.01, TE04.29.01, TE04.32.01, TE04.33.01, TE04.34.01, TE04.35.02, TE04.37.02, TE04.38.02, TE04.39.02, TE04.39.03, TE04.39.04, TE04.43.02, TE04.44.02, TE04.56.02 (L1 only)   | TE04.37.02, TE04.38.02, TE04.45.02, TE04.45.02, TE04.45.03, TE04.52.01, TE04.53.01 (L2 only),                                                                                                                                                                                                                                                                                                                                                              | TE04.39.02, TE04.39.03, TE04.39.04, TE04.42.03, TE04.42.04                                                                                                                                                                                                                                                 | TE04.59.01                                                                                                 |
   |                                     |                                                                                                                                                                                                                                                                                                                                                                                                |                                                                                                                                                                                                                                                                                                                                                                                                                                                            |                                                                                                                                                                                                                                                                                                            |                                                                                                            |
   |                                     |                                                                                                                                                                                                                                                                                                                                                                                                | TE04.54.02, TE04.54.03, TE04.55.02                                                                                                                                                                                                                                                                                                                                                                                                                         |                                                                                                                                                                                                                                                                                                            |                                                                                                            |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------+
   | Software/Firmware Security          | TE05.05.05, TE05.05.07, TE05.06.02, TE05.06.03, TE05.06.04, TE05.06.06, TE05.07.01, TE05.08.01, TE05.08.02, TE05.11.01, TE05.11.02, TE05.12.02, TE05.13.01, TE05.13.02, TE05.13.03, TE05.13.04, TE05.13.05, TE05.13.06, TE05.13.08                                                                                                                                                             | TE05.15.01, TE05.15.02, TE05.16.03, TE05.17.02                                                                                                                                                                                                                                                                                                                                                                                                             | TE05.20.01, TE05.23.01                                                                                                                                                                                                                                                                                     | none                                                                                                       |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------+
   | Operational Environment             | TE06.05.01, TE06.05.02, TE06.05.03, TE06.06.01, TE06.06.02, TE06.08.01, TE06.08.02, TE06.08.03                                                                                                                                                                                                                                                                                                 | The following TEs are for L2 only:                                                                                                                                                                                                                                                                                                                                                                                                                         | None                                                                                                                                                                                                                                                                                                       | None                                                                                                       |
   |                                     |                                                                                                                                                                                                                                                                                                                                                                                                | TE06.09.02, TE06.09.03, TE06.10.01, TE06.10.02, TE06.10.03, TE06.11.01, TE06.11.02, TE06.11.03, TE06.12.01, TE06.12.02, TE06.12.03, TE06.13.01, TE06.13.02, TE06.13.03, TE06.14.01, TE06.14.02, TE06.14.03, TE06.15.01, TE06.15.02, TE06.15.03, TE06.17.01, TE06.17.02, TE06.17.03, TE06.18.01, TE06.18.02, TE06.18.03, TE06.24.01, TE06.25.01, TE06.25.02, TE06.26.01, TE06.26.02, TE06.27.01, TE06.27.02, TE06.28.01, TE06.28.02, TE06.28.03, TE06.28.04 |                                                                                                                                                                                                                                                                                                            |                                                                                                            |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------+
   | Physical Security                   | TE07.01.02, TE07.10.02, TE07.11.02, TE07.13.01, TE07.15.01, TE07.37.01, TE07.43.01, TE07.60.01                                                                                                                                                                                                                                                                                                 | TE07.19.01, TE07.20.01, TE07.35.01, TE07.44.01, TE07.45.01, TE07.45.02, TE07.46.01, TE07.47.01, TE07.47.02, TE07.48.01, TE07.48.02, TE07.62.01, TE07.63.01                                                                                                                                                                                                                                                                                                 | TE07.25.01, TE07.26.01, TE07.27.01, TE07.37.03, TE07.39.03, TE07.39.04, TE07.39.05, TE07.39.06, TE07.50.02, TE07.50.03, TE07.51.04, TE07.51.05, TE07.51.06, TE07.51.08, TE07.51.09, TE07.65.04, TE07.65.05, TE07.65.06, TE07.65.08, TE07.65.09, TE07.77.01, TE07.77.02, TE07.77.03, TE07.81.01, TE07.81.02 | TE07.32.01, TE07.41.01, TE07.41.02, TE07.42.02, TE07.53.01, TE07.55.01, TE07.58.01, TE07.67.01, TE07.71.02 |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------+
   | Non-Invasive Security               | N/A                                                                                                                                                                                                                                                                                                                                                                                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                            |                                                                                                                                                                                                                                                                                                            |                                                                                                            |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------+
   | SSP Management                      | TE09.01.02, TE09.01.03, TE09.02.02, TE09.03.02, TE09.03.03, TE09.13.03, TE09.14.02, TE09.16.03, TE09.18.01, TE09.18.02, TE09.21.02, TE09.21.03, TE09.21.04, TE09.22.01, TE09.24.02, TE09.25.02, TE09.27.02, TE09.28.02, TE09.28.03, TE09.28.04, TE09.33.02, TE09.36.02, TE09.37.02                                                                                                             | None                                                                                                                                                                                                                                                                                                                                                                                                                                                       | None                                                                                                                                                                                                                                                                                                       | None                                                                                                       |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------+
   | Self-Tests                          | TE10.07.03, TE10.07.04, TE10.07.05, TE10.08.03, TE10.09.03, TE10.10.01, TE10.10.02, TE10.11.01, TE10.15.01, TE10.15.02, TE10.21.01, TE10.21.02, TE10.21.03, TE10.21.04, TE10.22.01, TE10.22.04, TE10.25.02, TE10.27.01, TE10.28.02, TE10.34.03, TE10.35.04, TE10.37.05, TE10.37.06, TE10.37.09, TE10.46.03, TE10.46.04, TE10.48.01, TE10.48.03, TE10.49.01, TE10.49.03, TE10.53.02, TE10.53.03 |                                                                                                                                                                                                                                                                                                                                                                                                                                                            | TE10.12.03, TE10.12.04, TE10.12.05, TE10.54.01                                                                                                                                                                                                                                                             |                                                                                                            |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------+
   | Life-Cycle Assurance                | TE11.08.06, TE11.08.09, TE11.11.01, TE11.13.02, TE11.32.02                                                                                                                                                                                                                                                                                                                                     |                                                                                                                                                                                                                                                                                                                                                                                                                                                            |                                                                                                                                                                                                                                                                                                            | TE11.28.02, TE11.28.03, TE11.28.04                                                                         |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------+
   | Mitigation of Other Attacks         | N/A                                                                                                                                                                                                                                                                                                                                                                                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                            |                                                                                                                                                                                                                                                                                                            |                                                                                                            |
   +-------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------+

A.2.1 TE Filters
----------------

Table 3 can be used to filter TEs based on module characteristics (“TE Filter Types” in the first column). This table is not an exhaustive list, and more filters could be discovered through use and further feedback.

.. table:: Table 3 - TE Filter Types and Example TEs within those Filters

   +------------------------------+------------------------------------+--------------------------------------+
   | **TE Filter Types**          | **Sampling of TEs within Filters**                                        |
   +                              +------------------------------------+--------------------------------------+
   |                              | **Filter Sub-Categories**          | **Sample TEs within Sub-Categories** |
   +==============================+====================================+======================================+
   | Module Type                  | Hardware                           | TE11.17.01                           |
   |                              +------------------------------------+--------------------------------------+
   |                              | Software                           | TE11.15.01                           |
   |                              +------------------------------------+--------------------------------------+
   |                              | Firmware                           | TE11.16.01                           |
   |                              +------------------------------------+--------------------------------------+
   |                              | Hybrid                             | TE02.18.01                           |
   +------------------------------+------------------------------------+--------------------------------------+
   | Security Level               | SL 1                               | TE05.13.01                           |
   +                              +------------------------------------+--------------------------------------+
   |                              | SL 2                               | TE05.17.01                           |
   +                              +------------------------------------+--------------------------------------+
   |                              | SL 3                               | TE03.21.01                           |
   +                              +------------------------------------+--------------------------------------+
   |                              | SL 4                               | TE07.41.01                           |
   +------------------------------+------------------------------------+--------------------------------------+
   | Embodiment Type              |                                    | TE07.09.01                           |
   +------------------------------+------------------------------------+--------------------------------------+
   | Capabilities                 | Bypass                             | TE10.22.01                           |
   +                              +------------------------------------+--------------------------------------+
   |                              | Self-Initiated Cryptographic       | TE04.23.01                           |
   +------------------------------+------------------------------------+--------------------------------------+
   | SSP                          | Manual Establishment               | TE10.07.01                           |
   +                              +------------------------------------+--------------------------------------+
   |                              | Automated Establishment            | TE09.10.02                           |
   +                              +------------------------------------+--------------------------------------+
   |                              | Wireless Manual Entry/Output       | TE09.18.01                           |
   +                              +------------------------------------+--------------------------------------+
   |                              | Automated Entry/Output             | TE09.03.01                           |
   +------------------------------+------------------------------------+--------------------------------------+
   | Self-Tests                   | Comparison Self-Test               | TE10.27.01                           |
   +                              +------------------------------------+--------------------------------------+
   |                              | Cryptographic Algorithm Self-Tests | TE10.25.01                           |
   +                              +------------------------------------+--------------------------------------+
   |                              | Pre-Operational Self-Tests         | TE10.53.01                           |
   +                              +------------------------------------+--------------------------------------+
   |                              | Comparison Self-Test               | TE10.33.01                           |
   +                              +------------------------------------+--------------------------------------+
   |                              | Critical Functions                 | TE10.24.01                           |
   +------------------------------+------------------------------------+--------------------------------------+
   | Operational Environment Type | Limited                            | TE06.03.01                           |
   +                              +------------------------------------+--------------------------------------+
   |                              | Non-Modifiable                     | TE06.03.01                           |
   +                              +------------------------------------+--------------------------------------+
   |                              | Modifiable                         | TE06.03.01                           |
   +------------------------------+------------------------------------+--------------------------------------+
   | Excluded Components          |                                    | TE02.13.01                           |
   +------------------------------+------------------------------------+--------------------------------------+
   | Modes of Operation           | Approved                           | TE02.10.01                           |
   +                              +------------------------------------+--------------------------------------+
   |                              | Non-Approved                       | TE02.20.01                           |
   +                              +------------------------------------+--------------------------------------+
   |                              | Degraded                           | TE02.26.01                           |
   +------------------------------+------------------------------------+--------------------------------------+
   | Interfaces                   | Data Input                         | TE03.05.01                           |
   +                              +------------------------------------+--------------------------------------+
   |                              | Data Output                        | TE03.06.01                           |
   +                              +------------------------------------+--------------------------------------+
   |                              | Control Input                      | TE03.08.01                           |
   +                              +------------------------------------+--------------------------------------+
   |                              | Control Output                     | TE03.09.01                           |
   +                              +------------------------------------+--------------------------------------+
   |                              | Status Output                      | TE03.10.01                           |
   +                              +------------------------------------+--------------------------------------+
   |                              | Power Input                        | TE03.13.01                           |
   +------------------------------+------------------------------------+--------------------------------------+
   | Software/Firmware Loading    |                                    | TE10.37.01                           |
   +------------------------------+------------------------------------+--------------------------------------+
   | Complete Image Replacement   |                                    | TE04.33.01                           |
   +------------------------------+------------------------------------+--------------------------------------+

The CMVP provided `Module Supplemental Information <https://csrc.nist.gov/csrc/media/Projects/cryptographic-module-validation-program/documents/fips%20140-3/Module%20Processes/SupplementalItems-V3.0.0.pdf>`__ (V3.0.0 as of 2024-09-04). While this does capture many filterable items, it is not currently used to filter the set of TEs for the module under test.

The TE WS produces the TETables.json file to reflect the TE classification documented in this paper. The ACMVP server will incorporate the TETables.json file to generate a fitting set of TEs for a given module specification.

The TE WS will work on completing the filter/mapping of TE Filter Types to their respective TEs.

A.2.2 Removing Assertions Not Separately Tested 
-----------------------------------------------

Some assertions are not separately tested, nor do they depend on the completion of other assertions and their TEs. For example: **AS05.22** is not separately tested, but is instead tested as part of **AS05.05**. Table 4 highlights some assertions which are not separately tested. Since testing these assertions are dependent on testing the assertion(s) that it points to, an approach is to use these assertions to further automate the report writing process. In this instance, the AS that is not separately tested could be marked as completed once the appropriate associated AS, VE, and TE are completed. This automation could take the form of a simple checking mechanic akin to the SP dependent TEs referenced in *Table 1*.

.. table:: Table 4 - Assertions not separately tested

   +-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | **FIPS 140-3 Section Title**            | **Assertions Not Separately Tested**                                                                                                                                                                                                                                                                                                                                                                                                   |
   +=========================================+========================================================================================================================================================================================================================================================================================================================================================================================================================================+
   | General                                 | N/A                                                                                                                                                                                                                                                                                                                                                                                                                                    |
   +-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Cryptographic Module Specification      | AS02.01, AS02.02, AS02.04, AS02.05, AS02.06, AS02.08, AS02.25, AS02.26, AS02.29, AS02.31, AS02.32                                                                                                                                                                                                                                                                                                                                      |
   +-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Cryptographic Module Interfaces         | AS03.12, AS03.17                                                                                                                                                                                                                                                                                                                                                                                                                       |
   +-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Roles, Services, and Authentication     | AS04.01, AS04.05, AS04.08, AS04.09, AS04.10, AS04.12, AS04.16, AS04.17, AS04.24, AS04.26, AS04.27, AS04.30, AS04.31, AS04.36, AS04.40, AS04.41, AS04.46, AS04.49, AS04.57, AS04.58                                                                                                                                                                                                                                                     |
   +-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Software/Firmware Security              | AS05.01, AS05.03, AS05.09, AS05.10, AS05.14, AS05.18, AS05.19, AS05.21, AS05.22                                                                                                                                                                                                                                                                                                                                                        |
   +-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Operational Environment                 | AS06.01, AS06.02, AS06.04, AS06.09, AS06.16, AS06.21, AS06.22, AS06.23, AS06.29                                                                                                                                                                                                                                                                                                                                                        |
   +-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Physical Security                       | AS07.02, AS07.03, AS07.04, AS07.05, AS07.06, AS07.07, AS07.08, AS07.14, AS07.16, AS07.17, AS07.18, AS.07.21, AS07.22, AS07.23, AS07.24, AS07.28, AS07.29, AS07.30, AS07.31, AS07.34, AS07.36, AS07.38, AS07.40, AS07.49, AS07.52, AS07.54, AS07.56, AS07.59, AS07.61, AS07.64, AS07.66, AS07.68, AS07.69, AS07.70, AS07.72, AS07.74, AS07.75, AS07.76, AS07.78, AS07.79, AS07.80, AS07.81, AS07.82, AS07.83, AS07.84, AS07.85, AS07.86 |
   +-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Non-Invasive Security                   | N/A                                                                                                                                                                                                                                                                                                                                                                                                                                    |
   +-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Sensitive Security Parameter Management | AS09.11, AS09.12, AS09.15, AS09.17, AS09.20, AS09.26, AS09.30, AS09.34, AS09.35                                                                                                                                                                                                                                                                                                                                                        |
   +-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Self-Tests                              | AS10.01, AS10.02, AS10.03, AS10.04, AS10.05, AS10.06, AS10.13, AS10.14, AS10.16, AS10.17, AS10.18, AS10.19, AS10.23, AS10.26, AS10.30, AS10.31, AS10.32, AS10.32, AS10.36, AS10.38, AS10.39, AS10.40, AS10.41, AS10.42, AS10.43, AS10.44, AS10.45, AS10.47, AS10.50, AS10.52, AS10.55                                                                                                                                                  |
   +-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Life-Cycle Assurance                    | AS11.02, AS11.07, AS11.09, AS11.10, AS11.12, AS11.14, AS11.20, AS11.22, AS11.27                                                                                                                                                                                                                                                                                                                                                        |
   +-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Mitigation of Other Attacks             | None                                                                                                                                                                                                                                                                                                                                                                                                                                   |
   +-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

A.3. Complete List of TEs
=========================

The table below provides a complete list of TEs, classified into four categories (i.e., SP-TE, OD-TE, SC-TC, FT-TE) and their potential combinations:

1. **SP-TE:** TEs depending on the SP

2. **SC-TE:** TEs depending on source code review or inspection

3. **OD-TE:** TEs depending on other vendor documentation

4. **FT-TE:** TEs depending on functional testing

5. **SP-TE/OD-TE:** TEs depending on vendor documentation, regardless whether it is SP *or* not

6. **SC-TE/SP-TE:** TEs depending on source code review *or* on the SP

7. **SP-TE, FT-TE:** TE depending on the SP *and* on functional testing

8. **SC-TE, FT-TE:** TE depending on source code review *and* on functional testing

Grayed-out TEs are those not currently required by the CMVP.

The OD-TEs depend on proprietary vendor documentation. Therefore, they do not belong to the SP-TE category.

Examples:

1. FT-TE:

   1. The tester shall verify, by exercising the module, that the status indicator is provided when the trusted channel is in use. (e.g., TE03.21.01)

   2. The tester shall verify that an identity-based authentication mechanism is employed for all services utilizing the trusted channel. (e.g., TE03.20.01)

2. SP-TE, FT-TE or SP-TE/OD-TE, FT-TE:

   1. The tester shall use the vendor documentation to assess multi-factor identity-based authentication. (e.g., TE04.59.01)

   2. The tester shall verify from the vendor documentation and by inspection that the approved authentication mechanism implemented in the operating system meets the applicable requirements. (TE04.53.01)

3. FT-TE, SP-TE or FT-TE, SP-TE/ OD-TE:

   1. The tester shall invoke the approved mode of operation using the vendor provided instructions found in the non-proprietary security policy. (e.g., TE02.19.02)

   2. The tester shall verify that the module implements a bypass capability as specified in the vendor documentation. (e.g., TE04.18.01)

+----------------------------------+-----------------------------------+
| TE02.03.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.03.02                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE02.07.01                       | SC-TE, SP-TE                      |
+----------------------------------+-----------------------------------+
| TE02.07.02                       | SC-TE, SP-TE                      |
+----------------------------------+-----------------------------------+
| TE02.09.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.10.01                       | SP-TE, SC-TE/FT-TE                |
+----------------------------------+-----------------------------------+
| TE02.10.02                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE02.11.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.11.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.12.01                       | SP-TE, FT-TE                      |
+----------------------------------+-----------------------------------+
| TE02.13.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.13.02                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE02.13.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE02.14.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.15.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.15.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.15.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE02.15.04                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.15.05                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE02.15.06                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.15.07                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.15.08                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.15.09                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.15.10                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.15.11                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.15.12                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.15.13                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.15.14                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.16.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.16.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.16.03                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.16.04                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE02.16.05                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.17.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.17.02                       | SP-TE, FT-TE                      |
+----------------------------------+-----------------------------------+
| TE02.17.03                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.17.04                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE02.17.05                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.17.06                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.17.07                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.17.08                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.17.09                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE02.17.10                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.18.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.19.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.19.02                       | FT-TE, SP-TE                      |
+----------------------------------+-----------------------------------+
| TE02.20.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.20.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.20.03                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.20.04                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.21.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.21.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.22.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.22.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE02.24.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.24.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE02.26.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.26.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.26.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE02.26.04                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE02.26.05                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE02.28.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE02.28.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE02.30.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE02.30.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.01.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE03.01.02                       | SP-TE, SC-TE                      |
+----------------------------------+-----------------------------------+
| TE03.01.03                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE03.01.04                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.02.01                       | SC-TE, FT-TE                      |
+----------------------------------+-----------------------------------+
| TE03.02.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE03.03.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE03.04.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE03.05.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.05.02                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE03.06.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.06.02                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE03.07.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE03.07.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.07.03                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE03.07.04                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.07.05                       | SP-TE/OD-TE, SC-TE                |
+----------------------------------+-----------------------------------+
| TE03.07.06                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE03.07.07                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE03.07.08                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.08.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.08.02                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE03.09.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE03.09.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.10.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE03.10.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.10.03                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE03.10.04                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.10.05                       | SC-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE03.11.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.11.02                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE03.11.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.13.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE03.13.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.14.01                       | SC-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE03.14.02                       | SC-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE03.14.03                       | FT-TE, SC-TE                      |
+----------------------------------+-----------------------------------+
| TE03.15.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE03.15.02                       | FT-TE, SC-TE                      |
+----------------------------------+-----------------------------------+
| TE03.15.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.15.04                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.15.05                       | SC-TE                             |
+----------------------------------+-----------------------------------+
| TE03.15.06                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.16.01                       | SP-TE/OD-TE, SC-TE/FT-TE          |
+----------------------------------+-----------------------------------+
| TE03.18.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE03.18.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.19.01                       | SP-TE/OD-TE, SC-TE                |
+----------------------------------+-----------------------------------+
| TE03.19.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.19.03                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE03.19.04                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.20.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.21.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE03.22.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.02.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE04.02.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.02.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.03.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE04.05.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE04.06.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE04.07.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE04.07.02                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE04.07.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.11.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE04.11.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.13.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.13.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE04.13.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.14.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE04.14.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.15.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.18.01                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE04.19.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE04.19.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.19.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.20.01                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE04.20.02                       | OD-TE                             |
+----------------------------------+-----------------------------------+
| TE04.20.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.21.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE04.21.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.22.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE04.22.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.23.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.25.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE04.25.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.25.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.28.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.29.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.32.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.33.01                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE04.34.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.35.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE04.35.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.37.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE04.37.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.38.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE04.38.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.39.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE04.39.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.39.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.39.04                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.42.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE04.42.02                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE04.42.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.42.04                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.43.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE04.43.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.44.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE04.44.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.45.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE04.45.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.45.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.47.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE04.48.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE04.50.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE04.50.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE04.51.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE04.51.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE04.52.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE04.53.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE04.54.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE04.54.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.54.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.55.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE04.55.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.56.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE04.56.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE04.59.01                       | SP-TE, FT-TE                      |
+----------------------------------+-----------------------------------+
| TE05.02.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE05.04.01                       | SC-TE                             |
+----------------------------------+-----------------------------------+
| TE05.05.01                       | SC-TE                             |
+----------------------------------+-----------------------------------+
| TE05.05.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE05.05.03                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE05.05.04                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE05.05.05                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE05.05.06                       | SC-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE05.05.07                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE05.06.01                       | SC-TE                             |
+----------------------------------+-----------------------------------+
| TE05.06.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE05.06.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE05.06.04                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE05.06.05                       | SC-TE                             |
+----------------------------------+-----------------------------------+
| TE05.06.06                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE05.07.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE05.08.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE05.08.02                       | FT-TE, SC-TE                      |
+----------------------------------+-----------------------------------+
| TE05.11.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE05.11.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE05.12.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE05.12.02                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE05.13.01                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE05.13.02                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE05.13.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE05.13.04                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE05.13.05                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE05.13.06                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE05.13.07                       | SC-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE05.13.08                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE05.15.01                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE05.15.02                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE05.16.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE05.16.02                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE05.16.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE05.17.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE05.17.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE05.20.01                       | SC-TE, FT-TE                      |
+----------------------------------+-----------------------------------+
| TE05.23.01                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE06.03.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE06.05.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE06.05.02                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE06.05.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.06.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE06.06.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.07.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE06.08.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE06.08.02                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE06.08.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.09.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE06.09.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.09.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.10.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE06.10.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.10.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.11.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE06.11.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.11.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.12.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE06.12.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.12.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.13.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE06.13.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.13.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.14.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE06.14.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.14.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.15.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE06.15.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.15.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.17.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE06.17.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.17.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.18.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE06.18.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.18.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.19.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE06.20.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE06.24.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE06.25.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE06.25.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.26.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE06.26.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.27.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE06.27.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.28.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE06.28.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.28.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE06.28.04                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.01.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE07.01.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.09.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE07.09.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE07.10.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE07.10.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.11.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE07.11.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.12.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE07.13.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.15.01                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.15.02                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE07.19.01                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.20.01                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.25.01                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.26.01                       | SP-TE/OD-TE FT-TE                 |
+----------------------------------+-----------------------------------+
| TE07.26.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE07.27.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.32.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE07.33.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE07.35.01                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.37.01                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.37.02                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE07.37.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.39.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE07.39.02                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE07.39.03                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.39.04                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.39.05                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.39.06                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.41.01                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.41.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.42.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE07.42.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.43.01                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.44.01                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.45.01                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.45.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.46.01                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.47.01                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.47.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.48.01                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.48.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.50.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE07.50.02                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.50.03                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.51.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE07.51.02                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE07.51.03                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE07.51.04                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.51.05                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.51.06                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.51.07                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE07.51.08                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.51.09                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.53.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE07.55.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE07.57.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE07.58.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.60.01                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.62.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.63.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.65.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE07.65.02                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE07.65.03                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE07.65.04                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.65.05                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.65.06                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE07.65.07                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE07.65.08                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.65.09                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.67.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE07.71.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE07.71.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.73.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE07.77.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.77.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.77.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.77.04                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE07.81.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.81.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE07.81.03                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| :gray:`TE08.03.01`               | :gray:`SP-TE/OD-TE`               |
+----------------------------------+-----------------------------------+
| :gray:`TE08.04.01`               | :gray:`SP-TE/OD-TE`               |
+----------------------------------+-----------------------------------+
| :gray:`TE08.05.01`               | :gray:`SP-TE/OD-TE`               |
+----------------------------------+-----------------------------------+
| :gray:`TE08.06.01`               | :gray:`SP-TE/OD-TE`               |
+----------------------------------+-----------------------------------+
| :gray:`TE08.07.01`               | :gray:`SP-TE/OD-TE`               |
+----------------------------------+-----------------------------------+
| TE09.01.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE09.01.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.01.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.02.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE09.02.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.03.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE09.03.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.03.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.04.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE09.04.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE09.05.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE09.06.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE09.06.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE09.06.03                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE09.07.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE09.08.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE09.08.02                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE09.09.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE09.09.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE09.10.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE09.10.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE09.13.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE09.13.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE09.13.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.14.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE09.14.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.16.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE09.16.02                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE09.16.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.18.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.18.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.19.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE09.21.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE09.21.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.21.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.21.04                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.22.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.23.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE09.23.02                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE09.23.04                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE09.24.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE09.24.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.25.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE09.25.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.27.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE09.27.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.28.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE09.28.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.28.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.28.04                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.28.05                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE09.28.06                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE09.29.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE09.29.02                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE09.31.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE09.32.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE09.33.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE09.33.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.36.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE09.36.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE09.37.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE09.37.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.07.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE10.07.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE10.07.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.07.04                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.07.05                       | FT-TE/SC-TE                       |
+----------------------------------+-----------------------------------+
| TE10.08.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE10.08.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE10.08.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.09.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE10.09.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE10.09.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.10.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.10.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.11.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.12.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE10.12.02                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE10.12.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.12.04                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.12.05                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.15.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE10.15.02                       | SC-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE10.20.01                       | SC-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE10.21.01                       | SP-TE/OD-TE, FT-TE                |
+----------------------------------+-----------------------------------+
| TE10.21.02                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE10.21.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.21.04                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.22.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.22.02                       | SC-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE10.22.03                       | SC-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE10.22.04                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.22.05                       | SC-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE10.24.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE10.24.02                       | SC-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE10.25.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE10.25.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.27.01                       | FT-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE10.28.01                       | SP-TE/OD-TE, SC-TE                |
+----------------------------------+-----------------------------------+
| TE10.28.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.29.01                       | SC-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE10.33.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE10.33.02                       | SC-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE10.34.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE10.34.02                       | SP-TE/OD-TE, SC-TE                |
+----------------------------------+-----------------------------------+
| TE10.34.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.35.01                       | SP-TE/OD-TE, SC-TE                |
+----------------------------------+-----------------------------------+
| TE10.35.02                       | SP-TE/OD-TE, SC-TE                |
+----------------------------------+-----------------------------------+
| TE10.35.03                       | SP-TE/OD-TE, SC-TE                |
+----------------------------------+-----------------------------------+
| TE10.35.04                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.37.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE10.37.02                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE10.37.03                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE10.37.04                       | SC-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE10.37.05                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.37.06                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.37.07                       | SC-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE10.37.08                       | SC-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE10.37.09                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.46.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE10.46.02                       | SC-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE10.46.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.46.04                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.48.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.48.02                       | SC-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE10.48.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.49.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.49.02                       | SC-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE10.49.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.51.01                       | SC-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE10.51.02                       | SC-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE10.51.03                       | SC-TE, SP-TE/OD-TE                |
+----------------------------------+-----------------------------------+
| TE10.53.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE10.53.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.53.03                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE10.54.01                       | FT-TE, SC-TE                      |
+----------------------------------+-----------------------------------+
| TE11.01.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.03.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.04.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.04.02                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.04.03                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.04.04                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.05.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.06.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.08.01                       | OD(FSM)-TE                        |
+----------------------------------+-----------------------------------+
| TE11.08.02                       | OD(FSM)-TE                        |
+----------------------------------+-----------------------------------+
| TE11.08.03                       | OD(FSM)-TE                        |
+----------------------------------+-----------------------------------+
| TE11.08.04                       | OD(FSM)-TE                        |
+----------------------------------+-----------------------------------+
| TE11.08.05                       | OD(FSM)-TE                        |
+----------------------------------+-----------------------------------+
| TE11.08.06                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE11.08.07                       | OD(FSM)-TE                        |
+----------------------------------+-----------------------------------+
| TE11.08.08                       | OD(FSM)-TE                        |
+----------------------------------+-----------------------------------+
| TE11.08.09                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE11.08.10                       | OD(FSM)-TE                        |
+----------------------------------+-----------------------------------+
| TE11.08.11                       | OD(FSM)-TE                        |
+----------------------------------+-----------------------------------+
| TE11.08.12                       | OD(FSM)-TE                        |
+----------------------------------+-----------------------------------+
| TE11.11.01                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE11.13.01                       | OD(FSM)-TE                        |
+----------------------------------+-----------------------------------+
| TE11.13.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE11.15.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.15.02                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.16.01                       | SC-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.17.01                       | SC-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.18.01                       | SC-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.19.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.21.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.23.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.24.01                       | SC-TE                             |
+----------------------------------+-----------------------------------+
| TE11.25.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.26.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.28.01                       | SC-TE                             |
+----------------------------------+-----------------------------------+
| TE11.28.02                       | FT-TE, SC-TE                      |
+----------------------------------+-----------------------------------+
| TE11.28.03                       | FT-TE, SC-TE                      |
+----------------------------------+-----------------------------------+
| TE11.28.04                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE11.29.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.29.02                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.30.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.31.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.32.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE11.32.02                       | FT-TE                             |
+----------------------------------+-----------------------------------+
| TE11.33.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.34.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.35.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE11.36.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE11.37.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE11.38.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE11.38.03                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE11.39.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE12.01.01                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE12.02.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE12.04.01                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TE12.04.02                       | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TE12.04.03                       | SP-TE                             |
+----------------------------------+-----------------------------------+
| TEA01.01                         | SP-TE/OD-TE                       |
+----------------------------------+-----------------------------------+
| TEB01.01                         | SP-TE                             |
+----------------------------------+-----------------------------------+
| TEB02.01                         | SP-TE                             |
+----------------------------------+-----------------------------------+
| TEB03.01                         | SP-TE                             |
+----------------------------------+-----------------------------------+
| TEB03.02                         | SP-TE                             |
+----------------------------------+-----------------------------------+
