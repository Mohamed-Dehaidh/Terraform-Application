resource "aws_launch_template" "my_launch_template" {
  name_prefix   = "my-launch-template"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  key_name                    = aws_key_pair.test_key.key_name

  # Base64-encode the user_data
  user_data = base64encode(<<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd
                systemctl enable httpd
                echo "Hello World from $(hostname -f)" > /var/www/html/index.html
                EOF
  )

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.ec2_sg.id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "my-ec2-instance"
    }
  }
}