locals {
  my_parameters = [
    {
      "prefix" = "/myprefix"
      "parameters" = [
        {
          "name"  = "myparameter"
          "value" = "myvalue"
        },
        {
          "name"  = "environment"
          "value" = "dev"
        }
      ]
    },
    {
      "prefix" = "/myapp"
      "parameters" = [
        {
          "name"  = "environment"
          "value" = "prod"
        }
      ]
    }
  ]
}

module "parameters" {
  source     = "./ssm-parameter"
  parameters = local.my_parameters
}
