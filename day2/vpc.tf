resource "aws_vpc" "vpc01" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc01"
  }
}
############################################
#AZ01 public
resource "aws_subnet" "az01_public_sub" {
  vpc_id     = aws_vpc.vpc01.id
  cidr_block = "10.0.1.0/24"
  availability_zone = us-west-1a
  map_public_ip_on_launch = true
  tags = {
    Name = "az01_public_sub"
  }
}
################ AZ01 private ##############
resource "aws_subnet" "az01_private_sub" {
  vpc_id     = aws_vpc.vpc01.id
  cidr_block = "10.0.2.0/24"
  availability_zone = us-west-1a
  tags = {
    Name = "az01_private_sub"
  }
}
###########################################
#AZ02 public
resource "aws_subnet" "az02_public_sub" {
  vpc_id     = aws_vpc.vpc01.id
  cidr_block = "10.0.3.0/24"
  availability_zone = us-west-1b
  map_public_ip_on_launch = true
  tags = {
    Name = "az02_public_sub"
  }
}
############## AZ02 private #######
resource "aws_subnet" "az02_private_sub" {
  vpc_id     = aws_vpc.vpc01.id
  cidr_block = "10.0.4.0/24"
  availability_zone = us-west-1b
  tags = {
    Name = "az02_private_sub"
  }
}