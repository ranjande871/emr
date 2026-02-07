variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "release_label" {
  type        = string
  description = "EMR release label, e.g. emr-6.15.0"
}

variable "application_type" {
  type        = string
  description = "Application type: spark or hive"
  validation {
    condition     = contains(["spark", "hive"], var.application_type)
    error_message = "application_type must be one of: spark, hive"
  }
}

variable "max_cpu" {
  type        = string
  description = "Max CPU, e.g. '4 vCPU'"
}

variable "max_memory" {
  type        = string
  description = "Max memory, e.g. '16 GB'"
}

# Existing network inputs (NO new VPC creation)
variable "existing_subnet_ids" {
  type        = list(string)
  description = "Existing private subnet IDs for EMR Serverless"
}

variable "existing_security_group_ids" {
  type        = list(string)
  description = "Existing security group IDs for EMR Serverless"
}

variable "tags" {
  type        = map(string)
  description = "Common tags"
  default     = {}
}
