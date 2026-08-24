Research Infrastructure 
=========================

The infrastructure workstream team adopted an iterative approach to modernize the CMVP supporting infrastructure. Each iteration introduced progressively advanced architectures, leveraging cloud-native services to improve scalability, portability, deployment speed, and security, all while ensuring cost efficiency. The modernization efforts have resulted in a containerized application that has been successfully deployed on the Amazon Elastic Container Service (ECS) and Amazon Elastic Kubernetes Service (EKS) platforms. The final iteration features Amazon EKS leveraging Bottlerocket Amazon Machine Images (AMIs) with FIPS 140-3 compliance enabled.  Furthermore, the modernized architecture integrates a managed database service to enhance operational efficiency and features a fully automated CI/CD pipeline to simplify and streamline server deployments on a Linux platform. Authentication flows have been migrated to leverage cloud-native solutions, including the AWS Network Load Balancer (NLB) providing TLS passthrough to the downstream web server.

The data that the ACMVP server currently collects is not large in volume due to the limited number of cryptographic modules and testing labs, nor does it require a large amount of compute to process due to the data being formatted in JSON. However, the Research Infrastructure workstream strives to provide robust practices and tools to enable the CMVP to adapt as needed in the event of volume increases and/or changes to the developed applications as a result of, for example, module testing requirement updates.

The research infrastructure workstream proposes this new cloud-native solution for adoption within the CMVP, pending approvals from the security teams at NIST to ensure the solution meets agency-level security guidelines. The workstream engaged in conversations with the security teams at NIST in an effort to ensure compliance during the potential adoption.

Research Infrastructure Workstream Collaborators
-------------------------------------------------

The Research Infrastructure Workstream is led by Raoul Gabiam of The MITRE Corporation and Douglas Boldt of Amazon, with contributions from Courtney Maatta, Annie Cimack, Diana Brooks, Charlotte Fondren, Zhuo-Wei Lee, Keonna Parrish, Abhishek Isireddy, Abi Adenuga, Bradley Wyman, Brittany Robinson, Gina McFarland, Damian Zell, Cavan Slaughter, Rayette Toles-Abdullah, Keith Hodo, John Dwyer, Ahmed Virani, Daftari Mrunal, Kasireddi Srikar Reddy, Srujana Alajangi, and Natti Swaminathan of Amazon; Robert Staples and Murugiah Souppaya of NIST; Jason Arnold of HII; Michael Dimond, Kyle Vitale, Phillip Millwee, and Josh Klosterman of the MITRE Corporation; and John Booton, Aaron Cook, and Jeffrey LaClair of ITC Federal.

.. toctree::
   :maxdepth: 3
   :titlesonly:
   :glob:
   :hidden:

   appendix-d.rst
   appendix-e/index.rst