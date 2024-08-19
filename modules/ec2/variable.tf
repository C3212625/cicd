variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "subnet_ids" {
  description = "The subnet IDs"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID"
  type        = string
}

variable "key_name" {
  description = "The key name for SSH access"
  type        = string
}
