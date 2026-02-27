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

    tags = var.tags
}

resource "aws_instance" "expense1" {
    count = length(var.instance_names)
    ami= var.ami_id
    instance_type = var.instance_names[count.index] == "mysql" ? "t3.small" : "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_t.id]

    tags = {
        Name = var.instance_names[count.index]
    } 
}