data "terraform_remote_state" "aws-state" {
    backend = "s3"
    config {
        bucket = "terraform-state-f29c5"
        key = "terraform.tfstate"
    	access_key = "${var.AWS_ACCESS_KEY}"
    	secret_key = "${var.AWS_SECRET_KEY}"
    	region = "${var.AWS_REGION}"
    }
}
