variable "application_name" { type = string }
variable "release_label"    { type = string } # e.g. emr-7.1.0
variable "application_type" { type = string } # spark | hive

variable "max_cpu"    { type = string } # e.g. "4 vCPU"
variable "max_memory" { type = string } # e.g. "16 GB"

# Existing network (no VPC creation)
variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

# Optional: monitoring
variable "enable_monitoring" {
  type    = bool
  default = true
}

variable "enable_cloudwatch_logs" {
  type    = bool
  default = true
}

variable "cloudwatch_log_group_name" {
  type        = string
  default     = null
  description = "If null, EMR Serverless creates default. Provide to control log group name."
}

variable "cloudwatch_log_stream_prefix" {
  type    = string
  default = "spark-logs"
}

# Optional: publish logs to S3 (monitoring)
variable "s3_log_uri" {
  type        = string
  default     = null
  description = "e.g. s3://my-bucket/emr/dev/logs/  (Optional)"
}

# Optional: auto start/stop
variable "enable_auto_start" {
  type    = bool
  default = true
}

variable "enable_auto_stop" {
  type    = bool
  default = true
}

variable "idle_timeout_minutes" {
  type    = number
  default = 15
}

variable "tags" {
  type    = map(string)
  default = {}
}
