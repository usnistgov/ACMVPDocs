Test Evidence Workstream
=========================

The ACMVP TE Workstream (WS) is led by Yi Mao of atsec and Alex Calis of NIST with contribution from the atsec team, Javier Martel and Michael McCarl of Aegisolve, Ryan Thomas of Lightship Security, James Reardon of Intertek Acumen Security, Barry Fussell and Andrew Karcher of Cisco, Alicia Squires and Courtney Maatta of Amazon, Marc Ireland of NXP, Shawn Geddis formerly of Apple, Mike Grimm of Microsoft, Ivan Teblin and Blaine Stone of SUSE, Michael Dimond of the MITRE Corporation, and Chris Celi and Murugiah Souppaya of NIST. 

The TE WS has identified and sorted categories of test evidence required for CMVP validation that can readily be automated in a reporting format that is consistent with current Web CRYPTIK used by CMVP. The TE WS has also identified those test evidence classes for which manual processes are still needed.

To date, the TE WS team has classified test evidence into the following categories, depending on what needs to be checked, inspected, or tested, and how the vendor evidence (VE) is supposed to be provided:

-	Assessments based on reviewing the vendor documentation, especially the Security Policy (SP)

-	Assessments based on inspecting the module's source code

-	Assessments based on exercising/executing the module to cover functional testing. 

The team has also described an approach to filtering test requirements to make the report focus only on the relevant requirements. TE WS output to date is presented in the :ref:`Appendix A. Technical Details from the Test Evidence (TE) Workstream` section. 

The main accomplishments of the TE WS to date are as follows:

1.	Classification/categorization of TEs

2.	AS/TE/VE (Assertions/Requirements for Tester/Requirements for Vendor) filtering

3.	A well-defined structure for test evidence data represented in JSON. These JSON files are used by other workstreams within the ACMVP to define the schema and provide opportunity for future automation (includes Security Policy JSON file to satisfy SP TEs.)

   * Example :download:`JSON file detailing the Test Evidence requirements<TETables.json>`

   * Example :download:`Empty JSON template for Test Evidence data submission<2024-09-09_sp_v5-8.json>`

   * Example :download:`Filled out JSON template for Test Evidence data submission<2024-09-09_awslc_sp_v5-8.json>`

4.	Alignment of the CMVP's Documentation TE List with TE classifications

The TE WS team is now working to complete: 

- Test methods for functional testing TEs

- Improvement of TE filtering coverage

- Finalizing the JSON structure for the test evidence catalogue
