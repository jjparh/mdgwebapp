#variable "aws_region" {
#  description = "AWS region."
#  default     = "eu-west-2"
#  type        = string
#}

#variable "access_key" {
#  type = string
#}

#variable "secret_key" {
#  type = string
#}

variable "aws_vpc_name" {
  type        = string
  description = "AWS VPC."
  default     = "interview_vpc"
}

variable "aws_vpc_cidr" {
  type        = string
  description = "AWS CIDR block for VPC."
  default     = "10.10.0.0/16"
}

variable "aws_vpc_azs" {
  type        = list(string)
  description = "AWS AZs"
  default     = ["eu-west-2a", "eu-west-2b"]
}

variable "aws_vpc_private_subnets" {
  type        = list(string)
  description = "Private subnets"
  default     = ["10.10.1.0/24", "10.10.2.0/24"]
}

variable "aws_vpc_public_subnets" {
  type        = list(string)
  description = "Public subnets"
  default     = ["10.10.11.0/24", "10.10.12.0/24"]
}

variable "enable_nat_gateway" {
  type        = bool
  description = "NAT enabled"
  default     = true
}

variable "environment" {
  type        = string
  description = "Environment"
  default     = "interview"
}

variable "ecs_iam_role_name" {
  type        = string
  description = "ECS IAM Role"
  default     = "interviewtaskecsrole"
}

variable "aws_ecs_cluster_name" {
  type        = string
  description = "ECS cluster"
  default     = "interview-ecs-cluster"
}

variable "aws_ecr_repository" {
  type        = string
  description = "ECR repo name"
  default     = "interviewproject"
}

variable "aws_ecs_task_def_fam" {
  type        = string
  description = "ECS task definition family"
  default     = "service"
}

variable "fargate_cpu" {
  type        = number
  description = "cpus"
  default     = 1048
}

variable "fargate_memory" {
  type        = number
  description = "memory"
  default     = 2096
}

variable "aws_ecs_service_name" {
  type        = string
  description = "service name"
  default     = "interview_ecs_svc"
}

variable "app_port" {
  type        = number
  description = "application container port"
  default     = 8000
}

variable "app_count" {
  type        = number
  description = "replicas of the pod"
  default     = 2
}

variable "ecs_alb_name" {
  type        = string
  description = "ALB Name"
  default     = "interview-ecs-alb"
}

variable "health_check_path" {
  type    = string
  default = "/"
}

variable "aws_sg_name" {
  type        = string
  description = "security group name"
  default     = "interview_ecs_sg"
}

variable "tag" {
  type    = string
  default = "interview"
}

variable "ecs_task_execution_role_name" {
  type    = string
  default = "interviewtaskecsrole"
}


