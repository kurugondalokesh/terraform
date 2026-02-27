resource "aws_security_group" "allow_for" {
    name = "allow_tf"
    description = "allow all trafficc from 22 port"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = var.tags
}

resource "aws_instance" "for-each" {
    for_each = var.instances
    ami= var.ami_id
    instance_type = each.value
    vpc_security_group_ids = [aws_security_group.allow_for.id]

    tags = {
        Name = each.value
    }
}