data "template_file" "jenkins-init" {
  template = "${file("scripts/jenkins-init.sh")}"
  vars {
    DEVICE = "${var.INSTANCE_DEVICE_NAME}"
    JENKINS_VERSION = "${var.JENKINS_VERSION}"
    TERRAFORM_VERSION = "${var.TERRAFORM_VERSION}"
  }
}
data "template_cloudinit_config" "cloudinit-jenkins" {

  gzip = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.jenkins-init.rendered}"
  }

}
