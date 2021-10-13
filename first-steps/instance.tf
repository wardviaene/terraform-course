terraform {
  backend "remote" {
    organization = "example-org-211007"
    workspaces {
      name = "Example-Workspace"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "javaapp"
  region  = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-036490d46656c4818"
  instance_type = "t3.micro"
  subnet_id     = "subnet-0a5aaf36bcd8711a3"
}

