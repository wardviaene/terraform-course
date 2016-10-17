#!/bin/bash
AMI_ID=`packer build -machine-readable packer.json | awk -F, '$0 ~/artifact,0,id/ {print $6}'`
echo 'variable "AMI_ID" { default = "'${AMI_ID}'" }' > amivar.tf
terraform apply
