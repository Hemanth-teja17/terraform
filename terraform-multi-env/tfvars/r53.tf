resource "aws_route53_record" "expense"{
    zone_id = var.zone_id
    for_each = aws_instance.terraform
    name = each.key=="frontend-prod" ? var.domain_name : "${each.key}.${var.domain_name}"
    type = "A"
    ttl = 1
    records = startswith(each.key, "frontend-prod")? [each.value.public_ip]:[each.value.private_ip]
    allow_overwrite = true

}