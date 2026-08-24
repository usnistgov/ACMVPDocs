Table 7 - Area 2 TEs Filtered by Security Level for Software Modules
=====================================================================

TE Filtering Criteria
_____________________

The TE Filtering criteria consists of the Module Information and Supplemental Information from the WebCryptik as the base. The CMVP provided `Module Supplemental Information <https://csrc.nist.gov/csrc/media/Projects/cryptographic-module-validation-program/documents/fips%20140-3/Module%20Processes/SupplementalItems-2025-06-25.pdf>`__ (dated 2025-06-25), but this is not currently used to tailor the set of TEs to fit the module under test.

In the CMVP's Module Supplemental Information (MSI) document, most Supplemental Information questions map to the security assertions (AS), test requirements (TE), implementation guidance (IG), and security policies, but a few questions are not mapped to any of these and are left blank. The list below reflects the CMVP's current MSI document. The TE Workstream provides a complete mapping of MSI questions to relevant TEs in Table 8.

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

    - Does the module require initialization steps to operate in the approved mode? - Certificate Caveat and Security Policy

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

.. table:: Table 7 - Area 2 TEs Filtered by Security Level for Software Modules

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
