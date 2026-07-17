variable "instance_name" {
    default = {
        mysql = "t3.small"
        backend = "t3.micro"
        frontend = "t3.micro"

    }
}

variable "zone_id"{
    default = "Z05483183URFWSF0B1Q10"
}

variable "zone_names"{
    default = "instance_names.{each.key}"
}

variable "domain_name"{
    default = "hemanthk.online"
}

variable ingress_rules{
default = [ 
    {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  },
   {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
]

}