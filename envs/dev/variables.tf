variable "aws_region" { type = string }
variable "account_id" { type = string }

variable "name_prefix" { type = string } # e.g. dev-emr

variable "vpc_cidr" { type = string }
variable "azs" { type = list(string) }
variable "private_subnet_cidrs" { type = list(string) }

variable "release_label" { type = string }
variable "application_type" { type = string }

variable "max_cpu" { type = string }
variable "max_memory" { type = string }

variable "tags" {
  type    = map(string)
  default = {}
}
