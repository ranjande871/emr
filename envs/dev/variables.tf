variable "aws_region" { type = string }

variable "application_name" { type = string }
variable "release_label"    { type = string }
variable "application_type" { type = string }

variable "max_cpu"    { type = string }
variable "max_memory" { type = string }

# Existing VPC details (no creation)
variable "existing_vpc_id" {
  type        = string
  description = "For reference/clarity (EMR uses subnet IDs)."
}

variable "existing_subnet_ids" {
  type = list(string)
}

variable "existing_security_group_ids" {
  type = list(string)
}

# Monitoring inputs
variable "enable_monitoring" { type = bool }
variable "enable_cloudwatch_logs" { type = bool }
variable "cloudwatch_log_group_name" { type = string }
variable "cloudwatch_log_stream_prefix" { type = string }
variable "s3_log_uri" { type = string }

# Auto start/stop
variable "enable_auto_start" { type = bool }
variable "enable_auto_stop" { type = bool }
variable "idle_timeout_minutes" { type = number }

# Optional S3 references for your job standards (not used by app)
variable "job_s3_bucket_name" { type = string }
variable "job_s3_prefix"      { type = string }

variable "tags" {
  type    = map(string)
  default = {}
}
