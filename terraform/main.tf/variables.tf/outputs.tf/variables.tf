variable "aws_region" {
  description = "AWS Region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance (Ubuntu 22.04 LTS recommended)"
  type        = string
  default     = "ami-04a81a99f5ec58529" # Приклад для us-east-1 (Ubuntu)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the AWS EC2 Key Pair created in AWS Console"
  type        = string
}
