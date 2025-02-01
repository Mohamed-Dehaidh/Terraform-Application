# NAT Gateway to allow private subnet to connect out the way
resource "aws_eip" "nat_gateway_eip" {
    vpc = true
}
resource "aws_nat_gateway" "NAT_GW" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = aws_subnet.Public_sub.id

  tags = {
    Name = "NAT_GW"
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.Internet_GW]
  }