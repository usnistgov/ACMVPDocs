Table 4 - Allowed Test Methods
=================================

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

.. table:: Table 4 - Allowed Test Methods

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
