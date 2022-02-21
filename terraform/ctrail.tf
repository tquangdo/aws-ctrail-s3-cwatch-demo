provider "aws" { 
    region = "us-east-1"
} 
resource "aws_cloudtrail" "my-demo-cloudtrail" { 
    name = "my-demo-cloudtrail-terraform" 
    s3_bucket_name = aws_s3_bucket.s3_bucket_name.id 
    include_global_service_events = true 
    is_multi_region_trail = true 
    enable_log_file_validation = true
} 
resource "aws_s3_bucket" "s3_bucket_name" { 
    bucket = "s3-cloudtrail-bucket-with-terraform-code" 
}
resource "aws_s3_bucket_policy" "attach_bucket_policy" {
    bucket = aws_s3_bucket.s3_bucket_name.id
    policy = file("policies/s3_policy.json")
}