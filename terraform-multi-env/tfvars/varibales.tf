variable "instance_name"{
    type = map

}

variable "common_tags"{
    default = {
        project = "expense"
        terraform = "true"
    }
}

variable "tags"{
    type = map
}

variable environment{

}

variable "zone_id"{
    default = "Z05483183URFWSF0B1Q10"
}


variable "domain_name"{
    default = "hemanth.k.online"
}