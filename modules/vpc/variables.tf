variable "project_name" {
  description = "the project name"
  type        = string
}
variable "environment" {
  description = "the environment"
  type        = string
}
variable "availability_zone" {
  description = "the availability zone for the subnet"
  type        = string

}
variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
}
variable "aws_vpc_cidr" {
  description = "The CIDR block for vpc"
  type        = string
}

