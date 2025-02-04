variable "instance_type" {
  type = string
}
variable "auto_scale_group" {
  type = map(number)
}