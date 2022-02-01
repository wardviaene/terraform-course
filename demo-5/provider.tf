provider "aws" {
  profile = "terraform"
  region     = "us-west-2"
}
terraform {
  backend "s3" {
    profile = "terraform"
    bucket  = "terraform-state-json"
    key     = "terraform-remote-state"
    region  = "us-west-2"
  }
}

