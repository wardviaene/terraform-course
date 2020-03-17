terraform {
  backend "s3" {
    bucket = "terraform-state-45k9c6pq"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}
