resource "aws_instance" "web1" {
  ami           = "enter-ami-id"
  instance_type = "t2.micro"
  subnet_id   = "enter-subnet-id"
  vpc_security_group_ids = [aws_security_group.allow_http_instances.id]
  key_name = "enter-key-name"
  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo service httpd start",
      "sudo chkconfig httpd on"
    ]

    connection {
    type     = "ssh"
    user     = "ec2-user"
    host     = aws_instance.web.public_ip
    private_key = file("${path.module}/key-name.pem")
  }  
    
}
}

resource "aws_instance" "web2" {
  ami           = "enter-ami-id"
  instance_type = "t2.micro"
  subnet_id   = "enter-your-subnet-id"
  vpc_security_group_ids = [aws_security_group.allow_http_instances.id]
  key_name = "enter-key-name"
  provisioner "remote-exec" {
    inline = [
      "sudo yum install https -y",
      "sudo service httpd start",
      "sudo chkconfig httpd on"
    ]

    connection {
    type     = "ssh"
    user     = "ec2-user"
    host     = aws_instance.web2.public_ip
    private_key = file("${path.module}/kay-name.pem")
  }  
    
}
}
