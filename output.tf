output "instance_id" {
    description = "AWS instance ID"
    value = aws_instance.test-server.id
}

output "instance_public_ip" {
  description = "Public IP"
  value = aws_instance.test-server.public_ip
}

output "instance_public_dns" {
  description = "Public DNS"
  value = aws_instance.test-server.public_dns
}