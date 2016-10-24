output "ELB" {
	value = "${aws_elb.my-elb.dns_name}"
}
