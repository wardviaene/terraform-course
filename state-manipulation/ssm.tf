resource "aws_ssm_parameter" "myparameter" {
  name  = "/myapp/myparameter"
  type  = "String"
  value = "myvalue"
}
