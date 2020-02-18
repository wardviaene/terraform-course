resource "aws_lb" "demo" {
  name               = "demo"
  subnets            = module.vpc.public_subnets
  load_balancer_type = "network"
}

resource "aws_lb_listener" "demo" {
  load_balancer_arn = aws_lb.demo.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.demo.id
    type             = "forward"
  }
}

resource "aws_lb_target_group" "demo" {
  name                 = "demo-http"
  port                 = "3000"
  protocol             = "TCP"
  target_type          = "ip"
  vpc_id               = module.vpc.vpc_id
  deregistration_delay = "30"

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    protocol            = "TCP"
    interval            = 30
  }
}
