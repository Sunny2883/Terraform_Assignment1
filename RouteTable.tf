

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