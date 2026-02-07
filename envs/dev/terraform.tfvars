aws_region  = "us-east-1"
account_id  = "209578578071"
name_prefix = "dev-emr-serverless"

vpc_cidr             = "10.20.0.0/16"
azs                  = ["us-east-1a", "us-east-1b"]
private_subnet_cidrs = ["10.20.1.0/24", "10.20.2.0/24"]

release_label    = "emr-6.15.0"
application_type = "spark"

# Keep small to avoid quota issues
max_cpu    = "4 vCPU"
max_memory = "16 GB"

tags = {
  Environment = "dev"
  Project     = "emr-serverless"
  ManagedBy   = "terraform"
  Owner       = "platform"
}
