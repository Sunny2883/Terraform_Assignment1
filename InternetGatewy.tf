resource "aws_internet_gateway" "gwTFAssignment1" {
  vpc_id = aws_vpc.VPCTFAssignment1.id

  tags = {
    Name = "gwTFAssinment1"
  }
}