locals {
  zone_id = "Z05483183URFWSF0B1Q10"
  domain_name = "hemanthk.online"
  instance_type = var.environment == "prod" ? "t3.small" : "t3.micro"
}


