output "elb" {
  value = aws_elb.myapp-elb.dns_name
}

