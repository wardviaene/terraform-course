locals {
  parameters = flatten([ 
    for parameters in var.parameters: [
      for keyvalues in parameters.parameters:
        {
          "name" = "${parameters.prefix}/${keyvalues.name}"
          "value" = keyvalues.value
        }
      ]
    ])
}

resource "aws_ssm_parameter" "parameter" {
  for_each = { for keyvalue in local.parameters: keyvalue.name => keyvalue.value }
  name     = each.key
  type     = "String"
  value    = each.value
}
