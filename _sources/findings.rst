Findings and Recommendations for Future Work 
================================================

TE Workstream outputs
-----------------------

The Test Evidence Workstream demonstrated how defining a structured approach to Test Evidence categorization based on security level and module type enables filtering of required Test Evidence for validation. This targeted approach enhances validation efficiency while maintaining rigorous security standards. 

Testing procedures and classifications of TEs reduce reviewer overhead by allowing them to focus only on requirements that cannot be easily automated. With the addition of the TE Filter, reviewers will not need to decide if requirements are applicable because those decisions have already been made prior to submission. The CMVP is determining how the new assurances collected will affect and shape the future of module reviews. 

An interested community such as the CMUF may define standardized test procedures for particular TEs to further streamline automation. Consistent test methodologies enable scripting and automation to provide pre-formatted outputs that conform with the protocol. 

Protocol and Development outputs
----------------------------------

The Protocol Workstream demonstrated how an application can process a well-defined and structured payload and provide instantaneous feedback on the completeness of the required data submitted for module validation. The following two key features are being integrated into the production CMVP environment:

The server implementation will act as a new front door for CMVP submissions with built-in checks for completeness and accuracy. Labs have the ability to respond to issues instantly before they become comments from a reviewer. 

An excerpt of the implementation of the TE Filter, called the Requirements Library, can be integrated into other projects. A NuGet package has been created from the ACMVP code and served internally as a resource for CMVP developers. The package implements the TE Filter and tracks all FIPS 140-3 requirements.

Future CMVP work includes incorporating other module submission types, such as those that affect existing validations. Additionally, updates to WebCryptik are necessary to help build the evidence payloads required for ACMVP. 

Infrastructure outputs
-----------------------

The Infrastructure Workstream demonstrated an iterative approach to modernizing the CMVP supporting infrastructure, enabling operational efficiency, portability, reproducibility, and CI/CD integration, while adhering to production-ready security compliance requirements. The close collaborative effort with the production CMVP team has resulted in showcasing desired capabilities, jump-starting the production infrastructure modernization. Cloud-native technologies, tools, and concepts demonstrated and covered in this document are being implemented in the production CMVP environment in collaboration with the NIST Infrastructure and Security teams as a testament to the operational efficiencies a modernized environment offers.

The approach and capabilities developed have an impact beyond CMVP and are applicable across NIST and the industry to modernize existing infrastructure and services.  
