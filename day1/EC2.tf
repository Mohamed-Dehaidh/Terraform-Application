resource "aws_instance" "webapp" {
    ami = "ami-0c614dee691cbbf37" 
    instance_type = "t2.micro"

    subnet_id = aws_subnet.Public_sub.id
    vpc_security_group_ids = [aws_security_group.security_group_myapp.id]
    key_name = "test_key"

    tags = {
        Name = "My-webapp-ec2"
    }
}
###############################################
resource "aws_instance" "Apache-ec2" {
    ami = "ami-0c614dee691cbbf37" 
    instance_type = "t2.micro"
    subnet_id = aws_subnet.Private_sub.id
    vpc_security_group_ids = [aws_security_group.security_group_apache.id]
    key_name = "test_key"

    tags = {
        Name = "Apache-EC2"
    }
}