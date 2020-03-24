#this is just a test
terraform {
  backend "s3" {
    bucket = "g3-mybucket1"   #####Name of the bucket
    #the path inside bucket. dont mention the name of the bucket again
    key    = "tf-jenkins/test/tfstate"  ########Path in the bucket
    region = "us-west-1"
  }
}
module "myec2" {
  source = "../../modules/ec2"
  instance_type = "t2.micro"
}
