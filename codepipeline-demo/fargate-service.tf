resource "aws_ecs_task_definition" "demo" {
  family = "demo"
  execution_role_arn = aws_iam_role.ecs-task-execution-role.arn
  task_role_arn = aws_iam_role.ecs-demo-task-role.arn
  cpu = 256
  memory = 512
  network_mode = "awsvpc"
  requires_compatibilities = [
    "FARGATE"
  ]

  container_definitions = <<DEFINITION
[
  {
    "essential": true,
    "image": "${aws_ecr_repository.demo.repository_url}",
    "name": "demo",
    "logConfiguration": {
            "logDriver": "awslogs",
            "options": {
               "awslogs-group" : "demo",
               "awslogs-region": "${var.AWS_REGION}",
               "awslogs-stream-prefix": "ecs"
            }
     },
     "secrets": [],
     "environment": [],
     "portMappings": [
        {
           "containerPort": 3000,
           "hostPort": 3000,
           "protocol": "tcp"
        }
     ]
  }
]
DEFINITION

}

resource "aws_ecs_service" "demo" {
  name = "demo"
  cluster = aws_ecs_cluster.demo.id
  desired_count = 1
  task_definition = aws_ecs_task_definition.demo.arn
  launch_type = "FARGATE"

  network_configuration {
    subnets = slice(module.vpc.public_subnets, 1, 2)
    security_groups = [aws_security_group.ecs-demo.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.demo.id
    container_name = "demo"
    container_port = "3000"
  }
  lifecycle {
    ignore_changes = [
      task_definition
    ]
  }
}

# security group
resource "aws_security_group" "ecs-demo" {
  name = "ECS demo"
  vpc_id = module.vpc.vpc_id
  description = "ECS demo"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}
