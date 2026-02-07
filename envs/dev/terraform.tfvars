aws_region = "us-east-1"

release_label    = "emr-6.15.0"
application_type = "spark"

# Keep small to avoid quota issues
max_cpu    = "4 vCPU"
max_memory = "16 GB"

existing_subnet_ids = [
  "subnet-xxxxxxxxxxxxxxxxx",
  "subnet-yyyyyyyyyyyyyyyyy"
]

existing_security_group_ids = [
  "sg-zzzzzzzzzzzzzzzzz"
]

tags = {
  Environment = "dev"
  Project     = "emr-serverless"
  ManagedBy   = "terraform"
  Owner       = "platform"
}
