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