variable "project_name" {
  description = "the name of the project"
  type        = string
}
variable "environment" {
  description = "the environment"
  type        = string
}
variable "instance_type" {
  description = "the instance type"
  type        = string
}
variable "public_subnet_id" {
  description = "the public subnet id"
  type        = string
}
variable "ami_id" {
  description = "the ami id for the instance"
  type        = string
}
variable "vpc_id" {
  description = "ID of the VPC for the EC2 security group"
  type        = string
}
