#!/bin/sh
echo "the next command is not necessary anymore in newer versions of terraform. You should create a backend.tf file"
terraform remote config -backend=s3 -backend-config="bucket=terraform-state-a2b6219" -backend-config="key=terraform/terraform.tfstate" -backend-config="region=eu-west-1"
