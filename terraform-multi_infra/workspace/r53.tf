resource "aws_route53_record" "terraform" {
    zone_id = "Z01771702MEQ3I9CTODSQ"
    records = terraform.workspace == "prod" ? [aws_instance.terraform.public_ip] : [aws_instance.terraform.private_ip]
    name = terraform.workspace == "prod" ? var.domain_name : "${terraform.workspace}.${var.domain_name}"
    type = "A"
    ttl = 1
    allow_overwrite =  true
}