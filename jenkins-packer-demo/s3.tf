resource "aws_s3_bucket" "terraform-state" {
  bucket = "g3-terraform-state-a2b621f"
  acl    = "private"

  tags = {
    Name = "Terraform state"
  }
}

