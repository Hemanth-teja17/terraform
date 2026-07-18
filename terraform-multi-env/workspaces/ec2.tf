resource "aws_instance" "terraform"{
    ami = "ami-0220d79f3f480ecf5"
    instance_type = lookup(var.instance_type, terraform.workspace)
    vpc_security_group_ids = ["sg-0864767c936d5fb73"]

    tags ={
        Name = "terraform-${terraform.workspace}"
    }
}
