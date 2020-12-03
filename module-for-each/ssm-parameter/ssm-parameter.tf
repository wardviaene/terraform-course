resource "aws_ssm_parameter" "parameter" {
  name  = var.name
  type  = "String"
  value = var.value
}
