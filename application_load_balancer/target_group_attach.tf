resource "aws_lb_target_group" "target-lb" {
  name     = "lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "enter_vpc_id"
}
resource "aws_lb_target_group_attachment" "test1" {
  target_group_arn = aws_lb_target_group.target-lb.arn
  target_id        = aws_instance.web1.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "test2" {
  target_group_arn = aws_lb_target_group.target-lb.arn
  target_id        = aws_instance.web2.id
  port             = 80
}
