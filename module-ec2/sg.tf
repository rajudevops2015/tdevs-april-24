resource "aws_security_group" "mysg" {
    name = "tdevs-allow-ssh.sg"

    ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
}