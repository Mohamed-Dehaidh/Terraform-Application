resource "tls_private_key" "key_gen" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
###################################################
resource "aws_key_pair" "test_key" {
  key_name   = "test_key"
  public_key = tls_private_key.key_gen.public_key_openssh
}
###################################################
resource "local_file" "private_key" {
  content  = tls_private_key.key_gen.private_key_pem
  filename = "${path.module}/test_key.pem"
  file_permission = "0400"
}