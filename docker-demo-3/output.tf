output "elb" {
  value = "${aws_elb.myapp-elb.dns_name}"
}
output "jenkins" {
  value = "${aws_instance.jenkins-instance.public_ip}"
}
output "myapp-repository-URL" {
  value = "${aws_ecr_repository.myapp.repository_url}"
}
