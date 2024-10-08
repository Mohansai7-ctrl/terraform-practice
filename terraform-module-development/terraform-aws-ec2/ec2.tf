resource "aws_instance" "expense" {
    for_each = var.instances
    ami = var.ami_id
    instance_type = var.instances
    vpc_security_group_ids = var.sg_id
    tags = {
        Name = each.key
    }
}