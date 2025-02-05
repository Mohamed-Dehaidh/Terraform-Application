resource "aws_nat_gateway" "nat_private_sub_az01" {
  allocation_id = aws_eip.nat_private_sub_az01_eip.id
  subnet_id     = aws_subnet.az01_private_sub.id

  tags = {
    Name = "nat_private_sub_az01"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}
# NAT Gateway to allow private subnet to connect out the way
resource "aws_eip" "nat_private_sub_az01_eip" {
    domain = "vpc"
}
##########################################################################################
resource "aws_nat_gateway" "nat_private_sub_az02" {
  allocation_id = aws_eip.nat_private_sub_az02_eip.id
  subnet_id     = aws_subnet.az02_private_sub.id

  tags = {
    Name = "nat_private_sub_az02"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}
# NAT Gateway to allow private subnet to connect out the way
resource "aws_eip" "nat_private_sub_az02_eip" {
     domain = "vpc"
}