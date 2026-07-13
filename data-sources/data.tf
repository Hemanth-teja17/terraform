data "aws_ami" "devops" {

  most_recent      = true
  owners           = ["973714476881"]

  # we will get all ami's from this account-owner and by filtering with name and other filter we can extract exact ami

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}