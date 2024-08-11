resource "aws_security_group" "first_security_group" {
  name        = "for_terraform"
  description = "learning terraform"

  ingress {
    description = "testing"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "testing"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "testing"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "testing"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "nodeapp"
  }
}

output "security-group-id" {
  value = aws_security_group.first_security_group.id
}

resource "aws_instance" "goldy1" {
  ami             = "ami-04a81a99f5ec58529"
  instance_type   = "t2.micro"
  key_name        = "goldy"
  security_groups = ["${aws_security_group.first_security_group.name}"]
  user_data       = file("${path.module}/userdata.sh")

  tags = {
    Name = "terraform"
  }
}
