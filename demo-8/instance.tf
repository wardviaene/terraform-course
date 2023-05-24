resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

  user_data = data.cloudinit_config.cloudinit-example.rendered

  tags = {
    Name = "myec2"
  }
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = local.zone-a
  size = 20
  type = "gp2"
  tags = {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = var.INSTANCE_DEVICE_NAME
  instance_id = aws_instance.example.id
  volume_id   = aws_ebs_volume.ebs-volume-1.id
  stop_instance_before_detaching = true
}