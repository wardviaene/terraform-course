data "cloudinit_config" "cloudinit-jenkins" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = templatefile("scripts/jenkins-init.sh", {
      DEVICE          = var.INSTANCE_DEVICE_NAME
      JENKINS_VERSION = var.JENKINS_VERSION
    })
  }
}

