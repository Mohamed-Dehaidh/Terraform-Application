resource "aws_vpc" "vpc01" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc01"
  }
}
resource "aws_subnet" "Public_sub" {
  vpc_id     = aws_vpc.vpc01.id
  cidr_block = "10.0.0.0/24"
  map_public_ip_on_launch = "true" # This is what makes it a public subnet
  availability_zone = "us-east-1a"
  tags = {
    Name = "Public_subnet"
  }
}
resource "aws_subnet" "Private_sub" {
  vpc_id     = aws_vpc.vpc01.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Private_subnet"
  }
}
