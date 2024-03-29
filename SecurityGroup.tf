
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