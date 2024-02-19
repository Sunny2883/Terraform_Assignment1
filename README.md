# Terraform_Assignment1
Steps of terraform configuration 
Create a new directory for your Terraform configuration.
•	mkdir Terraform_Assignment1
•	cd Terraform_Assignment1

Create a main.tf file with the provided content to define the EC2 instance configuration, VPC, subnet, route table, route table association, security group, and key pair.

 Initialize the Terraform working directory to download necessary plugins and modules.
•	terraform init
Generate an execution plan to review the changes Terraform will make.
•	terraform plan
Apply the Terraform configuration to create the EC2 instance and associated resources.
|dfasdf|asdfasdf|
|--|--|


|Configuration details|
|Provider| |AWS|
Region: |ap-south-1|
Instance Type: t2.micro
AMI: ami-06b72b3b2a773be2b (Amazon Linux 2 AMI)
Networking Resources
VPC Name: VPCTFAssignment1

CIDR Block: 10.0.0.0/16
Availability Zone: ap-south-1a

Subnet Name: SubnetTFAssignment1
CIDR Block: "10.0.1.0/24"
Associated VPC: VPCTFAssignment1
Route Table Name: RouteTableAssignment1TF
CIDR Block: 0.0.0.0/0
Associated VPC: VPCTFAssignment1
Associated Internet Gateway:   
  Name = "gwTFAssinment1"
Route Table Association Name: TableAssociationAssignment1

Associated Subnet: SubnetTFAssignment1
Associated Route Table: RouteTableAssignment1TF
Security Group Name: SecurityGroupAssignment1TF

Associated VPC: VPCTFAssignment1
Key Pair Name: keypair

EC2 Instance Details
Instance Name: FirstInstanceWithTerraform
Public IP: Always change after destroy
Instance Type: t2.micro
AMI: ami-06b72b3b2a773be2b (Amazon Linux 2 AMI)

