resource "aws_instance" "terraform" {
    ami = data.aws_ami.ami_info.id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = lookup(var.instances, terraform.workspace)
    tags = {
        Name = "${terraform.workspace}"
    }
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh_${terraform.workspace}"
    description = "allowing port 22 via ssh protocol"
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_ssh_${terraform.workspace}"
    }

}