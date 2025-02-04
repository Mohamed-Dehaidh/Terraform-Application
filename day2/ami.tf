data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]  # Amazon-owned official AMIs

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]  # Amazon Linux 2
  }
}