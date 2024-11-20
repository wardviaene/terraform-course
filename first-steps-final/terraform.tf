terraform {
  //backend "s3" {
  //  bucket = "terraform-a49cd32"
  //  key    = "first-steps/terraform.tfstate"
  //  region = "us-east-1"
  //
  //  dynamodb_table = "terraform-locking"
  //}
}
provider "aws" {
  region = "us-east-1"
}
