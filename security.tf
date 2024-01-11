resource "aws_security_group" "security_usuario" {

  name = "allow_http_and_ssh"
  description = "Allow HTTP and SSH inbound traffic"
  vpc_id = aws_vpc.terraform-vpc.id

    ingress {
        description = "HTTP from everywhere"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    
    ingress {
        description = "SSH from everywhere"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        description = "Allow to send to everywhere"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
