variable "bucket_name" {
   description = "Name of the S3 bucket"
   type = string
}

variable "environment" {
   description = "Environment name"
   type = string
   default = "Learning"
}

variable "ami_id" {
	description = "AMI ID for EC2 instance"
	type = string
}

variable "subnet_id" {
	description = "Subnet ID to launchEC2 into"
	type = string 
}
