resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraform-state-${random_string.random.result}"
  acl    = "private"

  tags = {
    Name = "Terraform state"
  }
}

resource "random_string" "random" {
  length  = 8
  special = false
  upper   = false
}

