variable "environment"{
    default= "prod"
}

variable "instance_names"{
    type = list(string)
    default = ["mysql", "backend", "frontend"]
}

variable "common_tags"{
    type = map
    default ={
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
    }
}

variable "zone_id"{
    default = "Z05483183URFWSF0B1Q10"
}

variable "zone_names"{
    default = "instance_names.[count.undex]"
}

variable "domain_name"{
    default = "hemanthk.online"
}