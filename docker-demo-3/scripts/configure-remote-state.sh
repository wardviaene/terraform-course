#!/bin/bash

echo "Newer terraform versions have a new way of defining a backend. Copy paste the following code in a backend.tf file, modify the region/s3 bucket, and execute 'terraform init' to initialize the backend. You'll be asked to copy the data from the local backend to the s3 backend, which you can answer yes.
"
echo 'backend.tf
==========
terraform {
  backend "s3" {
    bucket = "terraform-state-a3c731f"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
'
