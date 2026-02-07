aws_region = "us-east-1"

application_name = "dev-emr-serverless"
release_label    = "emr-7.1.0"
application_type = "spark"

# Keep conservative due to quota issues
max_cpu    = "4 vCPU"
max_memory = "16 GB"

existing_vpc_id = "vpc-xxxxxxxxxxxxxxxxx"

existing_subnet_ids = [
  "subnet-aaaaaaaaaaaaaaaaa",
  "subnet-bbbbbbbbbbbbbbbbb"
]

existing_security_group_ids = [
  "sg-ccccccccccccccccccccc"
]

enable_monitoring            = true
enable_cloudwatch_logs       = true
cloudwatch_log_group_name    = "/aws/emr-serverless/dev-emr-serverless"
cloudwatch_log_stream_prefix = "spark-logs"

# Optional: S3 log publishing from monitoring configuration
s3_log_uri = "s3://emr-serverless-209578578071-us-east-1-dev/emr/dev/logs/"

enable_auto_start    = true
enable_auto_stop     = true
idle_timeout_minutes = 15

# Just for standards/documentation (used at job run time)
job_s3_bucket_name = "emr-serverless-209578578071-us-east-1-dev"
job_s3_prefix      = "emr/dev"

tags = {
  Environment = "dev"
  Project     = "emr-serverless"
  ManagedBy   = "terraform"
  Owner       = "platform"
}
