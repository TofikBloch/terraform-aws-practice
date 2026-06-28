terraform {
    required_providers {
	aws = {
	   source = "hashicorp/aws"
	   version = "~> 5.0"			
	}
     }	
}

provider "aws" {
	region = "ap-south-1"
}

data "aws_ami" "amazon_linux" {
	most_recent = true
	owners = ["amazon"]

	filter {
	  name = "name"
	  values = ["al2023-ami-minimal-2023*-x86_64"]
	}

	filter {
	  name = "state"
	  values = ["available"]
	}
}

data "aws_subnet" "default" {
	filter {
	  name = "defaultForAz"
	  values = ["true"]
	}

	filter {
	  name = "availabilityZone"
	  values = ["ap-south-1a"]
	}
}

resource "aws_s3_bucket" "my_first_bucket" {
	bucket = var.bucket_name

	tags = {
	   Name = "TerraformPractice"
	   Environment = var.environment 
	   ManagedBy = "Terraform"
	}
}

resource "aws_security_group" "ec2_sg" {
	name = "terraform-practice-sg"
	description = "Allow SSH"

	ingress {
	  from_port = 22
	  to_port = 22
	  protocol = "tcp"
	  cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_instance" "my_ec2" {
	ami = data.aws_ami.amazon_linux.id
	instance_type = "t2.micro"
	subnet_id = data.aws_subnet.default.id
	vpc_security_group_ids = [aws_security_group.ec2_sg.id]
	associate_public_ip_address = true

	tags = {
	  Name = "TerraformPractice"
	  ManagedBy = "Terraform"
	}
}
