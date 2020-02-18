provider "aws" {
  region = var.AWS_REGION
}

data "aws_availability_zones" "available" {
}

data "aws_caller_identity" "current" {
}
