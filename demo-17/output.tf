output "eb" {
	value = "${aws_elastic_beanstalk_environment.app-prod.cname}"
}
