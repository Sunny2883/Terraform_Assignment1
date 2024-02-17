terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

}
provider "aws" {

  region = "ap-south-1"

}

resource "aws_vpc" "VPCTFAssignment1" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "VPCTFAssignment1"
  }
}

resource "aws_subnet" "subnetTFAssignment1" {
  vpc_id = aws_vpc.VPCTFAssignment1.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  
  tags = {
    Name="subnetTFAssignment1"
  }

}
resource "aws_internet_gateway" "gwTFAssignment1" {
  vpc_id = aws_vpc.VPCTFAssignment1.id

  tags = {
    Name = "gwTFAssinment1"
  }
}
resource "aws_route_table" "RouteTableAssignment1TF" {
  vpc_id = aws_vpc.VPCTFAssignment1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gwTFAssignment1.id
  }



  tags = {
    Name = "routeTFAssinment1"
  }
}

resource "aws_route_table_association" "tableassociationAssignment1" {
  subnet_id      = aws_subnet.subnetTFAssignment1.id
  route_table_id = aws_route_table.RouteTableAssignment1TF.id
}

resource "aws_security_group" "SecurityGroupAssignement1TF" {
    description = "Allow HTTP (port 80) and SSH (port 22) ingress traffic"
  name = "SecurityGroupAssignement1TF"
  vpc_id = aws_vpc.VPCTFAssignment1.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  
    cidr_blocks = ["0.0.0.0/0"]  
  }
}


resource "aws_key_pair" "key-tf" {
  key_name ="keypair"
  public_key = file("${path.module}/id_rsa.pub")
}
resource "aws_instance" "myFirstServerbyTerraform" {
  ami                    = "ami-06b72b3b2a773be2b"
  instance_type          = "t2.micro"
  key_name = "${aws_key_pair.key-tf.key_name}"
  vpc_security_group_ids = [aws_security_group.SecurityGroupAssignement1TF.id]
  subnet_id = aws_subnet.subnetTFAssignment1.id
  associate_public_ip_address = true
  tags = {
    Name = "FirstInstanceWithTerraform"
  }
  user_data = <<EOF
#!bin/bash
yum -y update
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "Hello World" > /var/www/html/index.html
    EOF

}



