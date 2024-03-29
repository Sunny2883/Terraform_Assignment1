# Terraform_Assignment1

Basic EC2 Instance Creation with Terraform

Objective: In this assignment, you will create a basic Terraform configuration to provision an EC2 instance on AWS.

Description:

This Terraform project directory contains a comprehensive set of configuration files for provisioning an EC2 instance on AWS. The main.tf file serves as the primary configuration file, instance.tf includes parameters such as instance type, AMI, and other essential settings required for creating the EC2 instance. Additionally, the directory includes specific files such as key-pair.tf, security.tf, routetable.tf, and others, each responsible for configuring different aspects of the EC2 instance and its associated resources.

Overview:

The main.tf file serves as the central configuration file, Instance file specifying the parameters and settings necessary for provisioning an EC2 instance on AWS.

Additional configuration files, such as key-pair.tf, security.tf, and routetable.tf, focus on specific aspects of the EC2 instance setup, such as defining key pairs, configuring security groups, and managing route tables.

Each configuration file plays a vital role in configuring different components of the EC2 instance and its associated resources, ensuring comprehensive and efficient provisioning.

I can customize the configuration settings in each file according to their specific requirements, providing flexibility and adaptability to different use cases.

Requirements -• Terraform v1.7.3 installed on Windows_amd64.

                  terraform --version 

![terraform version](image-3.png)

Steps of terraform configuration.

Create a new directory for your Terraform configuration.
            	mkdir Terraform_Assignment1
            	cd Terraform_Assignment1



Configuration details
|Name|Value|
|--|--|
|Provider|AWS|
|Region|ap-south-1|
|Instance Type|t2.micro|
|AMI|ami-06b72b3b2a773be2b|


Networking Resources
VPC:
|Name|Value|
|--|--|
|VPC Name|VPCTFAssignment1|
|CIDR Block|10.0.0.0/16|
|Availability Zone|ap-south-1a|

Subnet:
|Name|Value|
|--|--|
|Subnet Name|SubnetTFAssignment1|
|CIDR Block|"10.0.1.0/24"|
|Associated VPC|VPCTFAssignment1|

Route Table:
|Name|Value|
|--|--|
|Route Table Name|RouteTableAssignment1TF|
|CIDR Block|0.0.0.0/0|
|Associated VPC|VPCTFAssignment1|
Associated Internet Gateway:   
|Name|"gwTFAssinment1"|

Route Table Association:
|Name|Value|
|--|--|
|Name|TableAssociationAssignment1|
|Associated Subnet|SubnetTFAssignment1|
|Associated Route Table|RouteTableAssignment1|
|Security Group Name|SecurityGroupAssignment1TF|
|Associated VPC|VPCTFAssignment1|

Key Pair
|Name|Value|
|--|--|
|Name| keypair|

EC2 Instance Details
|Name|Value|
|--|--|
|Instance Name|FirstInstanceWithTerraform|
|Public IP|Always change after destroy|
|Instance Type| t2.micro|
|AMI| ami-06b72b3b2a773be2b|


 Initialize the Terraform working directory to download necessary plugins and modules.

                	terraform init

terraform init:

Purpose: Initialize a Terraform project in a directory.

Usage: Run terraform init in the root directory of your Terraform configuration files. Functionality: Downloads necessary plugins and modules specified in the configuration files. Sets up the working directory and prepares it for Terraform's use.

Example Usage: Use terraform init to initialize the Terraform environment before starting any infrastructure provisioning or management tasks.

![terraform init command](image-2.png)

Generate an execution plan to review the changes Terraform will make.

                	terraform plan

Purpose: Generate an execution plan for changes to the infrastructure.

Usage: Run terraform plan after initializing the Terraform project.

Functionality: Analyzes the current state of the infrastructure and compares it to the desired state specified in the configuration files. Provides a preview of the actions Terraform will take to achieve the desired state.

![terrafoem plan command](image-1.png)


Apply the Terraform configuration to create the EC2 instance and associated resources.

                 terraform apply
Purpose: Apply changes to the infrastructure according to the Terraform configuration.

Usage: Run terraform apply after reviewing the execution plan.

Functionality: Executes the planned actions generated during the planning phase. Creates, modifies, or deletes resources as specified in the configuration files. Updates the Terraform state file to reflect the changes made to the infrastructure.

Example Usage: Apply the changes to the infrastructure by running terraform apply after confirming the execution plan.

![Terraform apply command](image.png)