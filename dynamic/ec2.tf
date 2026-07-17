resource "aws_instance" "terraform" {
 ami = "ami-09c813fb71547fc4f"
 for_each = var.instance_name
 instance_type = each.value
 vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

 tags = {
    Name = each.key
 }


}
 
resource "aws_security_group" "allow_ssh_terraform" {
    name = "dynamic-demo"
    description = "allow all ssh 22 ports"

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    
  dynamic "ingress"{
    for_each = var.ingress_rules
    content { #give content key word which block want to iterate in dynamic
      from_port = ingress.value["from_port"]
      to_port   = ingress.value["to_port"]
      protocol  = ingress.value["protocol"]
      cidr_blocks = ingress.value.cidr_blocks

    }

  }

    tags = {
        Name = "allow_ssh"
    }
}
