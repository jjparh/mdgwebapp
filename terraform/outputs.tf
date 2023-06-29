output "ec2_public_ip" {
  description = "mdgtask public ip"
  value       = module.ec2.public_ip
}