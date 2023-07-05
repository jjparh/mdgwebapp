[
  {
    "name": "$(aws_ecr_repository)",
    "image": "${app_image}:${tag}",
    "cpu": ${fargate_cpu},
    "memory": ${fargate_memory},
    "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "/ecs/int-app",
          "awslogs-region": "${aws_region}",
          "awslogs-stream-prefix": "ecs"
        }
    },
    "portMappings": [
      {
        "containerPort": ${app_port},
        "hostPort": ${app_port}
      }
    ]
  }
]