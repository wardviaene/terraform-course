resource "aws_security_group" "allow_http" {
  name        = "alb_http"
  description = "Allow http traffic to alb"
  vpc_id      = "enter_vpc_id"

  ingress {
    description = "http for alb"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http_alb"
  }
}

resource "aws_security_group" "allow_http_instances" {
  name        = "instances_http"
  description = "Allow http traffic to instances"
  vpc_id      = "enter_vpc_id"

  ingress {
    description = "http for instances"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.allow_http.id]
  }

ingress {
    description = "ssh for instances"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http_instaces"
  }
}
