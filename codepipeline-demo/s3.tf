#
# cache s3 bucket
#
resource "aws_s3_bucket" "codebuild-cache" {
  bucket = "demo-codebuild-cache-${random_string.random.result}"
}

resource "aws_s3_bucket" "demo-artifacts" {
  bucket = "demo-artifacts-${random_string.random.result}"
  
  # lifecycle moved to aws_s3_bucket_lifecycle_configuration (Change starting from AWS Provider 4.x)
}

resource "aws_s3_bucket_lifecycle_configuration" "demo-artifacts-lifecycle" {
  bucket = aws_s3_bucket.demo-artifacts.id

  rule {
    id     = "clean-up"
    status = "Enabled"

    expiration {
      days = 30
    }
  }
}


resource "random_string" "random" {
  length  = 8
  special = false
  upper   = false
}

