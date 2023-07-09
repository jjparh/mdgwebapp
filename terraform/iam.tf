data "aws_iam_policy_document" "ecs_task_execution_role" {
  version = "2012-10-17"
  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

# ECS task execution role
resource "aws_iam_role" "ecs_task_execution_role" {
  name               = var.ecs_task_execution_role_name
  assume_role_policy = data.aws_iam_policy_document.ecs_task_execution_role.json
}

# ECS task execution role policy attachment
resource "aws_iam_role_policy_attachment" "ecs_task_execution_role" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}



####################################################

resource "aws_iam_role" "int_ecs_service" {
  name = "int_ecs-service"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

data "aws_iam_policy_document" "int_ecs_service_alb" {
  statement {
    effect = "Allow"

    actions = [
      "ec2:Describe*"
    ]

    resources = [
      "*"
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
      "elasticloadbalancing:DeregisterTargets",
      "elasticloadbalancing:Describe*",
      "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
      "elasticloadbalancing:RegisterTargets"
    ]

    resources = [
      "*"
    ]
  }
}

data "aws_iam_policy_document" "int_ecs_service_standard" {

  statement {
    effect = "Allow"

    actions = [
      "ec2:DescribeTags",
      "application-autoscaling:*",
      "ecs:DeregisterContainerInstance",
      "ecs:DiscoverPollEndpoint",
      "ecs:Poll",
      "ecs:RegisterContainerInstance",
      "ecs:StartTelemetrySession",
      "ecs:UpdateContainerInstancesState",
      "ecs:Submit*",
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = [
      "*"
    ]
  }
}

data "aws_iam_policy_document" "int_ecs_service_scaling" {

  statement {
    effect = "Allow"

    actions = [
      "application-autoscaling:*",
      "ecs:DescribeServices",
      "ecs:UpdateService",
      "cloudwatch:DescribeAlarms",
      "cloudwatch:PutMetricAlarm",
      "cloudwatch:DeleteAlarms",
      "cloudwatch:DescribeAlarmHistory",
      "cloudwatch:DescribeAlarms",
      "cloudwatch:DescribeAlarmsForMetric",
      "cloudwatch:GetMetricStatistics",
      "cloudwatch:ListMetrics",
      "cloudwatch:PutMetricAlarm",
      "cloudwatch:DisableAlarmActions",
      "cloudwatch:EnableAlarmActions",
      "iam:CreateServiceLinkedRole",
      "sns:CreateTopic",
      "sns:Subscribe",
      "sns:Get*",
      "sns:List*"
    ]

    resources = [
      "*"
    ]
  }
}

resource "aws_iam_policy" "int_ecs_service_alb" {
  name = "int_ecs_service_alb"
  path = var.health_check_path
  description = "Allow access to the service alb"

  policy = data.aws_iam_policy_document.int_ecs_service_alb.json
}

resource "aws_iam_policy" "int_ecs_service_standard" {
  name = "int_ecs_service_standard"
  path = var.health_check_path
  description = "Allow standard ecs actions"

  policy = data.aws_iam_policy_document.int_ecs_service_standard.json
}

resource "aws_iam_policy" "int_ecs_service_scaling" {
  name = "int_ecs_service_scaling"
  path = var.health_check_path
  description = "Allow ecs service scaling"

  policy = data.aws_iam_policy_document.int_ecs_service_scaling.json
}

resource "aws_iam_role_policy_attachment" "int_ecs_service_alb" {
  role = aws_iam_role.int_ecs_service.name
  policy_arn = aws_iam_policy.int_ecs_service_alb.arn
}

resource "aws_iam_role_policy_attachment" "int_ecs_service_standard" {
  role = aws_iam_role.int_ecs_service.name
  policy_arn = aws_iam_policy.int_ecs_service_standard.arn
}

resource "aws_iam_role_policy_attachment" "int_ecs_service_scaling" {
  role = aws_iam_role.int_ecs_service.name
  policy_arn = aws_iam_policy.int_ecs_service_scaling.arn
}