#creating security group each for dev and for prod as allow_ssh_dev and allow_ssh_prod
resource "aws_security_group" "allow_ssh" {
    name = "${var.sg_name}_${var.environment}"
    description = "port 22 via ssh protocol"
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    #Using dynamic block, as this incoming network ingress having multiples blocks ingress_info
    dynamic ingress {
        for_each = var.ingress_info
        content {
            from_port = ingress.value["from_port"]
            to_port = ingress.value["to_port"]
            protocol = ingress.value["protocol"]
            cidr_blocks = ingress.value["cidr_blocks"]

        }
    }

    tags = merge(
        var.common_tags,
        var.tags,
        {
            Name = "allow_ssh_${var.environment}"
        }
    )
}

#creating ec2_instances
resource "aws_instance" "terraform" {
    for_each = var.instances
    instance_type = each.value
    ami = data.aws_ami.ami_info.id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = merge(
        var.common_tags,
        var.tags,
        {
            Name = each.key
        }
    )
}