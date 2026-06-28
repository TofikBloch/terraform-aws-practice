output "bucket_name" {
	description = "The name of the S3 bucket"
	value = aws_s3_bucket.my_first_bucket.bucket
}

output "bucket_arn" {
	description = "The ARN of the S3 bucket"
	value = aws_s3_bucket.my_first_bucket.arn
}

output "ec_public_ip" {
	description = "Public IP of the EC2 instance"
	value = aws_instance.my_ec2.public_ip
}

output "ec2_instance_id" {
	description = "Instance ID of the EC2 instance"
	value = aws_instance.my_ec2.id
}
