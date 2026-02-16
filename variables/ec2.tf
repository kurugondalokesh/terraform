resource "aws_security_group" "allow_ssh_t" {
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

    tags = {
        Name = "allow_tf"
    }
}

resource "aws_instance" "terraform" {
    ami= var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_ssh_t.id]

    tags = {
        Name = "terraform"
    }
}