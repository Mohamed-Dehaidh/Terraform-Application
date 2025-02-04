resource "aws_lb" "elb" {
  name               = "elastic_load_balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.load_balancer_sg.id]
  subnets            = [aws_subnet.az01_public_sub.id, aws_subnet.az02_public_sub.id]
}
################################################################
# Target group
resource "aws_alb_target_group" "tg" {
  name     = "ec2_tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc01.id

  health_check {
    path                = "/"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    matcher             = "200-299"
  }
}
################################################################
#Listerner
resource "aws_alb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.elb.arn
  port              = "80"
  protocol          = "HTTP"
  depends_on        = [aws_alb_target_group.tg]

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.tg.arn
  }
}