package main

import (
	"github.com/aws/constructs-go/constructs/v10"
	"github.com/aws/jsii-runtime-go"
	"github.com/hashicorp/terraform-cdk-go/cdktf"

	"cdk.tf/go/stack/generated/hashicorp/aws"
	"cdk.tf/go/stack/generated/hashicorp/aws/ec2"
)

func NewMyStack(scope constructs.Construct, id string) cdktf.TerraformStack {
	stack := cdktf.NewTerraformStack(scope, &id)

	// The code that defines your stack goes here

	aws.NewAwsProvider(stack, jsii.String("aws"), &aws.AwsProviderConfig{
		Region: jsii.String("eu-west-1"),
	})

	amiID := getUbuntuAMI(stack)

	instance := ec2.NewInstance(stack, jsii.String("compute"), &ec2.InstanceConfig{
		Ami:          amiID.Id(),
		InstanceType: jsii.String("t2.micro"),
	})

	cdktf.NewTerraformOutput(stack, jsii.String("public_ip"), &cdktf.TerraformOutputConfig{
		Value: instance.PublicIp(),
	})

	return stack
}

func main() {
	app := cdktf.NewApp(nil)

	NewMyStack(app, "cdktf-go")

	app.Synth()
}

func getUbuntuAMI(stack cdktf.TerraformStack) ec2.DataAwsAmi {
	return ec2.NewDataAwsAmi(stack, jsii.String("computeAMI"), &ec2.DataAwsAmiConfig{
		Filter: &[]*ec2.DataAwsAmiFilter{
			{
				Name:   jsii.String("name"),
				Values: jsii.Strings("ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"),
			},
			{
				Name:   jsii.String("virtualization-type"),
				Values: jsii.Strings("hvm"),
			},
		},
		Owners:     jsii.Strings("099720109477"),
		MostRecent: true,
	})
}
