resource "aws_autoscaling_group" "ec2_cluster" {
  name                 = "auto_scaling_group"
  min_size             = var.auto_scale_group.min
  max_size             = var.auto_scale_group.max
  desired_capacity     = var.auto_scale_group.desired
  health_check_type    = "EC2"
  launch_configuration = aws_launch_configuration.ec2_launch_config.name
  vpc_zone_identifier  = [aws_subnet.az01_private_sub.id, aws_subnet.az02_private_sub.id]
  target_group_arns    = [aws_alb_target_group.tg.arn]
}
#############################################################################################
resource "aws_launch_configuration" "ec2_launch_config" {
  name                        = "ec2-launch-config"
  image_id                    = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  security_groups             = [aws_security_group.ec2_sg.id]
  key_name                    = aws_key_pair.test_key.key_name
  associate_public_ip_address = false
  user_data = <<-EOL
  #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "hello from $(hostname -I)" > /var/www/html/index.html
              EOL
}