output "public_ip" {
  description = "the public ip for the ec2"
  value       = aws_instance.ec2.public_ip
}
output "instance_id" {
  description = "the id for the instance"
  value       = aws_instance.ec2.id
}
