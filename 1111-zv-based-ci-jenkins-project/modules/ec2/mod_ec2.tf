resource "aws_instance" "myweb" {
   ami = "${var.ami}"
   instance_type = "${var.instance_type}"
   security_groups = ["default"]
   # this tag block lets add to explain CI
   #tags =  {
      #Managed = "Automation with jenkins tool"
   #}
}
	
