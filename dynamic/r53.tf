resource "aws_route53_record" "expense"{
  for_each = aws_instance.terraform # here we should use only for output value bcz it is for else we can use 
  zone_id = var.zone_id
  name    = each.key == "frontend" ? "var.domain_name":"${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = each.key == "frontend" ? [each.value.public_ip]: [each.value.private_ip]
}