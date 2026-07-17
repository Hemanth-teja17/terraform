resource "aws_instance" "terraform" {
 ami = "ami-0220d79f3f480ecf5"
 for_each = var.instance_name
 instance_type = each.value
 vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

 tags = merge ( 
    var.common_tags,
    var.tags,
    {
    Name = each.key
 }
 )

}
 
resource "aws_security_group" "allow_ssh_terraform" {
    name = "allow-ssh-${var.environment}"
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

    tags = merge ( 
    var.common_tags,
    var.tags,
    {
        Name = "allow_ssh-${var.environment}"
    }
    )
}
