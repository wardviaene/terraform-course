#!/bin/bash
packer build -machine-readable packer-example.json | tee build.log
AMI_ID=`egrep -m1 -oe 'ami-.{8}' build.log`
echo 'variable "AMI_ID" { default = "'${AMI_ID}'" }' > amivar.tf
terraform apply
