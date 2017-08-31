#!/bin/sh
# not necessary anymore in newer terraform versions, you can use a backend.tf file
if [ "`terraform --version |head -n1`" == "Terraform v0.7.7" ] ; then
  terraform remote config -backend=s3 -backend-config="bucket=terraform-state-a2b621f" -backend-config="key=terraform/terraform.tfstate" -backend-config="region=eu-west-1"
fi
