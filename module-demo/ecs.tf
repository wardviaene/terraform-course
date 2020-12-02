data "aws_caller_identity" "current" {
}

module "my-ecs" {
  source         = "github.com/in4it/terraform-modules//modules/ecs-cluster"
  vpc_id         = module.vpc.vpc_id
  cluster_name   = "my-ecs"
  instance_type  = "t2.small"
  ssh_key_name   = aws_key_pair.mykeypair.key_name
  vpc_subnets    = join(",", module.vpc.public_subnets)
  enable_ssh     = true
  ssh_sg         = aws_security_group.allow-ssh.id
  log_group      = "my-log-group"
  aws_account_id = data.aws_caller_identity.current.account_id
  aws_region     = var.AWS_REGION
}

module "my-service" {
  source              = "github.com/in4it/terraform-modules//modules/ecs-service"
  vpc_id              = module.vpc.vpc_id
  application_name    = "my-service"
  application_port    = "80"
  application_version = "latest"
  cluster_arn         = module.my-ecs.cluster_arn
  service_role_arn    = module.my-ecs.service_role_arn
  aws_region          = var.AWS_REGION
  healthcheck_matcher = "200"
  cpu_reservation     = "256"
  memory_reservation  = "128"
  log_group           = "my-log-group"
  desired_count       = 2
  alb_arn             = module.my-alb.lb_arn
}

module "my-alb" {
  source             = "github.com/in4it/terraform-modules//modules/alb"
  vpc_id             = module.vpc.vpc_id
  lb_name            = "my-alb"
  vpc_subnets        = module.vpc.public_subnets
  default_target_arn = module.my-service.target_group_arn
  domain             = "*.ecs.newtech.academy"
  internal           = false
  ecs_sg             = [module.my-ecs.cluster_sg]
}

module "my-alb-rule" {
  source           = "github.com/in4it/terraform-modules//modules/alb-rule"
  listener_arn     = module.my-alb.http_listener_arn
  priority         = 100
  target_group_arn = module.my-service.target_group_arn
  condition_field  = "host-header"
  condition_values = ["subdomain.ecs.newtech.academy"]
}
