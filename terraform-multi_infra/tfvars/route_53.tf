resource "aws_route53_record" "terraform" {
    for_each = aws_instance.terraform
    zone_id = "Z01771702MEQ3I9CTODSQ"
    records = startswith(each.key,"frontend") ? [each.value.public_ip] : [each.value.private_ip]
    name = each.key == "frontend-prod" ? local.domain_name : "${each.key}.${local.domain_name}"
    type = "A"
    ttl = 1
    allow_overwrite = true

}