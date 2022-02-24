# note: previous templatefile datasources have been replaced by the template_file() function

data "template_cloudinit_config" "cloudinit-example" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = template_file("scripts/init.cfg", {
      REGION = var.AWS_REGION
    })
  }

  part {
    content_type = "text/x-shellscript"
    content      = template_file("scripts/volumes.sh", {
      DEVICE = var.INSTANCE_DEVICE_NAME
    })
  }
}

