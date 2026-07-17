resource "aws_instance" "terraform" {
 ami = "ami-0220d79f3f480ecf5"
 instance_type = "t3.micro"
 vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
 #key_name               = "terraform-key"
 tags = {
    Name = "terraform"
 }
 provisioner "local-exec" {
    command = "echo ${self.private_ip} > private_ip.txt"
                #or aws_instance.terraform.private_ip
       }
  connection{
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      #private_key = file("C:/Users/Repository/terraform-key.pem")
      host = self.public_ip
  }
  provisioner "remote-exec"{
    inline =[
      "sudo dnf install ansible -y",
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }
  provisioner "remote-exec"{
    when= destroy
    inline =[
           "sudo systemctl stop nginx"
    ]
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
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    tags = {
        Name = "allow_ssh"
    }
}
