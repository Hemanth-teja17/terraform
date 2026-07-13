resource "aws_instance" "expense"{
 #count = length(var.instance_names)
 ami = data.aws_ami.devops.id
 instance_type = "t3.micro"
 vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

 #tags =merge(
  #   var.common_tags,
  #   {
  #   Name = var.instance_names[count.index]
  #    }
  # )

tags = {
    Name = "terraform"
  }
}
 
resource "aws_security_group" "allow_ssh_terraform" {
    name = "allow-ssh"
    description = "allow all ssh 22 ports"

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    
    ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    tags = {
        Name = "allow_ssh"
    }
}
