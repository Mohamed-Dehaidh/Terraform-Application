resource "aws_internet_gateway" "Internet_GW" {
  vpc_id = aws_vpc.vpc01.id

  tags = {
    Name = "Internet_Gateway"
  }
}
################################################
# Public routes
resource "aws_route_table" "Public_RT" {
    vpc_id = aws_vpc.vpc01.id
    
    route {
        cidr_block = "0.0.0.0/0" 
        gateway_id = aws_internet_gateway.Internet_GW.id
    }
    
    tags = {
        Name = "Public_RT"
    }
}
resource "aws_route_table_association" "Public_association"{
    subnet_id = aws_subnet.Public_sub.id
    route_table_id = aws_route_table.Public_RT.id
}
###################################################
# Private routes
resource "aws_route_table" "Private_RT" {
    vpc_id = aws_vpc.vpc01.id
    
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.NAT_GW.id
    }
    
    tags = {
        Name = "prod-private-crt"
    }
}
resource "aws_route_table_association" "Private_association"{
    subnet_id = aws_subnet.Private_sub.id
    route_table_id = aws_route_table.Private_RT.id
}
