aws_region = "us-east-1"

name          = "dev-emr-serverless"
release_label = "emr-6.15.0"
type          = "SPARK"

s3_bucket = "emr-serverless-209578578071-us-east-1-dev"
s3_prefix = "emr/dev"


enable_cloudwatch_logs = true
log_retention_days     = 14

driver_worker_count   = 1
executor_worker_count = 2

driver_cpu    = "2 vCPU"
driver_memory = "4 GB"

executor_cpu    = "2 vCPU"
executor_memory = "4 GB"

max_cpu    = "2 vCPU"
max_memory = "4 GB"

enable_vpc         = false
subnet_ids         = []
security_group_ids = []

tags = {
  Environment = "dev"
  ManagedBy   = "terraform"
  Owner       = "platform"
  Project     = "emr-serverless"
}
