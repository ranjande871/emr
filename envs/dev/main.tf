module "emr_serverless" {
  source = "../../modules/emr-serverless-app"

  application_name = var.application_name
  release_label    = var.release_label
  application_type = var.application_type

  max_cpu    = var.max_cpu
  max_memory = var.max_memory

  subnet_ids         = var.existing_subnet_ids
  security_group_ids = var.existing_security_group_ids

  enable_monitoring             = var.enable_monitoring
  enable_cloudwatch_logs        = var.enable_cloudwatch_logs
  cloudwatch_log_group_name     = var.cloudwatch_log_group_name
  cloudwatch_log_stream_prefix  = var.cloudwatch_log_stream_prefix
  s3_log_uri                    = var.s3_log_uri

  enable_auto_start     = var.enable_auto_start
  enable_auto_stop      = var.enable_auto_stop
  idle_timeout_minutes  = var.idle_timeout_minutes

  tags = var.tags
}

output "emr_serverless_application_id" {
  value = module.emr_serverless.application_id
}

output "emr_serverless_application_arn" {
  value = module.emr_serverless.application_arn
}

# Just for visibility in outputs (not used by app):
output "job_s3_location" {
  value = "s3://${var.job_s3_bucket_name}/${trim(var.job_s3_prefix, \"/\")}/"
}
