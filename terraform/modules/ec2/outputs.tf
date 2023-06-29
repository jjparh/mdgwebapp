output "public_ip" {
  description = "public ip address"
  value       = aws_instance.mdgtask.public_ip
}