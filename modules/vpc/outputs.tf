output "vpc_id" {
  description = "the vpc id"
  value       = aws_vpc.dev_vpc.id
}

output "public_subnet_id" {
  description = "the public subnet"
  value       = aws_subnet.public_subnet.id
}
