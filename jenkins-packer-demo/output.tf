output "jenkins-ip" {
  value = ["${aws_instance.jenkins-instance.*.public_ip}"]
}
output "app-ip" {
  value = ["${aws_instance.app-instance.*.public_ip}"]
}
