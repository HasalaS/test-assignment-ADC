output "instance_public_ip" {
  value       = aws_lightsail_static_ip.static_ip.ip_address
}

output "instance_username" {
  value       = aws_lightsail_instance.prometheus_instance.username
}
