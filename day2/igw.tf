resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc01.id

  tags = {
    Name = "gw"
  }
}
###########################################################################
resource "aws_route_table" "public_sub_az01_rt" {
  vpc_id = aws_vpc.vpc01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "public_sub_az01_rt"
  }
}
resource "aws_route_table_association" "public_sub_az01_rt_ass" {
  subnet_id      = aws_subnet.az01_public_sub.id
  route_table_id = aws_route_table.public_sub_az01_rt.id
}
###############################################################################
resource "aws_route_table" "public_sub_az02_rt" {
  vpc_id = aws_vpc.vpc01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "public_sub_az02_rt"
  }
}
resource "aws_route_table_association" "public_sub_az02_rt_ass" {
  subnet_id      = aws_subnet.az02_public_sub.id
  route_table_id = aws_route_table.public_sub_az02_rt.id
}
###############################################################################
resource "aws_route_table" "private_sub_az01_rt" {
  vpc_id = aws_vpc.vpc01.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_private_sub_az01.id
  }
  tags = {
    Name = "private_sub_az01_rt"
  }
}
resource "aws_route_table_association" "private_sub_az01_rt_ass" {
  subnet_id      = aws_subnet.az01_private_sub.id
  route_table_id = aws_route_table.private_sub_az01_rt.id
}
###############################################################################
resource "aws_route_table" "private_sub_az02_rt" {
  vpc_id = aws_vpc.vpc01.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_private_sub_az02.id
  }
  tags = {
    Name = "private_sub_az02_rt"
  }
}
resource "aws_route_table_association" "private_sub_az02_rt_ass" {
  subnet_id      = aws_subnet.az02_private_sub.id
  route_table_id = aws_route_table.private_sub_az02_rt.id
}