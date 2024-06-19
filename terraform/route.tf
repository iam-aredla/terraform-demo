#Step5: Create Route Table for public subnet
resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

#Step6: Create route table association for pubic subnet
resource "aws_route_table_association" "publicRTassociation" {
  subnet_id      = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.publicRT.id
}