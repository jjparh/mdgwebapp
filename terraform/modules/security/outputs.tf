output "mdgtask_sg_id" {
  description = "mdgtask sg id"
  value       = aws_security_group.mdgtask.id
}

output "alb_sg_id" {
  description = "alb sg id"
  value       = aws_security_group.alb.id
}