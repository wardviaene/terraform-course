locals {
  my_parameters = {
    environment = "development"
    version     = "1.0"
    mykey       = "myvalue"
  }
}

module "parameters" {
  for_each = local.my_parameters
  source   = "./ssm-parameter"
  name     = each.key
  value    = each.value
}

output "all-my-parameters" {
  value = { for k, parameter in module.parameters: k => parameter.arn }
}
