# Jenkins packer demo build
```
ARTIFACT=`packer build -machine-readable packer-demo.json |awk -F, '$0 ~/artifact,0,id/ {print $6}'`
AMI_ID=`echo $ARTIFACT | cut -d ':' -f2`
echo 'variable "APP_INSTANCE_AMI" { default = "'${AMI_ID}'" }' > amivar.tf
aws s3 cp amivar.tf s3://terraform-state-a2b62lf/amivar.tf
```

# Jenkins terraform build
```
cd jenkins-packer-demo
aws s3 cp s3://terraform-state-a2b62lf/amivar amivar.tf
touch mykey
touch mykey.pub
terraform apply -auto-approve -var APP_INSTANCE_COUNT=1 -target aws_instance.app-instance
```
