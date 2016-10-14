provider "cloudinit" {}

resource "template_file" "init-script" {
  template = "${file("scripts/init.cfg")}"
  vars {
    region = "${var.AWS_REGION}"
  }
}
resource "template_file" "shell-script" {
  template = "${file("scripts/volumes.sh")}"
}
resource "template_cloudinit_config" "cloudinit-example" {

  gzip = false
  base64_encode = false

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = "${template_file.init-script.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${template_file.shell-script.rendered}"
  }

}
