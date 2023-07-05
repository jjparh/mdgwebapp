# Set up CloudWatch group and log stream and retain logs for 30 days
resource "aws_cloudwatch_log_group" "int_log_group" {
  name              = "/ecs/int-app"
  retention_in_days = 30

  tags = {
    Name = "int-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "int_log_stream" {
  name           = "int-log-stream"
  log_group_name = aws_cloudwatch_log_group.int_log_group.name
}