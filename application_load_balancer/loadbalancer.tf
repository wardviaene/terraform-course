resource "aws_lb" "my-lb" {
  name               = "lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]
  # Enter you subnet ids under vpc below
  subnets            = ["subnet-id1","subnet-id2","subnet-id3","subnet-id4"]

  enable_deletion_protection = false



  tags = {
    name = "my-first-load-balancer"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.my-lb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-lb.arn
  }
}
