output "instance_id" {
  description = "ID of EC2 instance"
  value = aws_instance.example.host_id
}

output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value = aws_instance.example.public_ip
}

output "rds" {
  value = aws_db_instance.mariadb.endpoint
}