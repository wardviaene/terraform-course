module "myec2" {
  source = "../../modules/ec2"
  instance_type = "t2.micro"
}
