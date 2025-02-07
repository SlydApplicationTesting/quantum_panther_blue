resource "aws_ecs_task_definition" "app" {
  family                   = "fargate-task"
  network_mode             = "awsvpc"
  requires_compatibilities   = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "app"
      image     = "your-container-image"
      essential = true
      portMappings = [{
        containerPort = 80
        hostPort      = 80
      }]
    }
  ])
}