resource "aws_autoscaling_group" "ec2_cluster" {
  name                 = "auto_scaling_group"
  min_size             = 2
  max_size             = 2
  desired_capacity     = 2
  health_check_type    = "EC2"
  vpc_zone_identifier  = [aws_subnet.az01_private_sub.id, aws_subnet.az02_private_sub.id]
  target_group_arns    = [aws_alb_target_group.tg.arn]
  launch_template {
    id      = aws_launch_template.my_launch_template.id
    version = "$Latest"
  }
}
#############################################################################################