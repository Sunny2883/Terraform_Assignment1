resource "aws_subnet" "subnetTFAssignment1" {
  vpc_id = aws_vpc.VPCTFAssignment1.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  
  tags = {
    Name="subnetTFAssignment1"
  }

}