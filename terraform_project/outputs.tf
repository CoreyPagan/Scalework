output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.web_instance.public_ip
}

output "subnet_id" {
  description = "Subnet ID"
  value       = aws_subnet.public_subnet.id
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.my_vpc.id
}
