variable "name" { type = string }
variable "release_label" { type = string }
variable "type" { type = string }

variable "s3_bucket" { type = string }
variable "s3_prefix" { type = string }

variable "enable_cloudwatch_logs" { type = bool }
variable "log_retention_days" { type = number }

variable "driver_worker_count" { type = number }
variable "executor_worker_count" { type = number }

variable "driver_cpu" { type = string }
variable "driver_memory" { type = string }

variable "executor_cpu" { type = string }
variable "executor_memory" { type = string }

variable "max_cpu" { type = string }
variable "max_memory" { type = string }

variable "enable_vpc" { type = bool }
variable "subnet_ids" { type = list(string) }
variable "security_group_ids" { type = list(string) }

variable "tags" { type = map(string) }
