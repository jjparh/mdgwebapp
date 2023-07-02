
output "alb_id" {
  value = aws_alb.main.id
}

output "alb_hostname" {
  value = aws_alb.main.dns_name
}