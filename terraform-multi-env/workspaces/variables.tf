variable "instance_type" {
  type        = map
  default     = {
    dev = "t3.micro"
    prod = "t3.micro"
    mysql = "t3.small"
  }
}
