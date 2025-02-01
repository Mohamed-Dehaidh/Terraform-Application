resource "aws_security_group" "security_group_apache" {
  name        = "security_group_apache"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc01.id

  tags = {
    Name = "security_group_apache"
  }
}

resource "aws_vpc_security_group_ingress_rule" "Apache_ingress_rule" {
  security_group_id = aws_security_group.security_group_apache.id
  cidr_ipv4         = aws_vpc.vpc01.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

###############################################################################
resource "aws_security_group" "security_group_myapp" {
  name        = "security_group_myapp"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc01.id

  tags = {
    Name = "security_group_myapp"
  }
}
resource "aws_vpc_security_group_ingress_rule" "myapp_ingress_rule" {
  security_group_id = aws_security_group.security_group_myapp.id
  cidr_ipv4         = aws_vpc.vpc01.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}


resource "aws_vpc_security_group_egress_rule" "myapp_engress_rule" {
  security_group_id = aws_security_group.security_group_myapp.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
