module "emr_serverless" {
  source = "../../modules/emr-serverless-app"

  name          = var.name
  release_label = var.release_label
  type          = var.type

  s3_bucket = var.s3_bucket
  s3_prefix = var.s3_prefix

  enable_cloudwatch_logs = var.enable_cloudwatch_logs
  log_retention_days     = var.log_retention_days

  driver_worker_count   = var.driver_worker_count
  executor_worker_count = var.executor_worker_count

  driver_cpu    = var.driver_cpu
  driver_memory = var.driver_memory

  executor_cpu    = var.executor_cpu
  executor_memory = var.executor_memory

  max_cpu    = var.max_cpu
  max_memory = var.max_memory

  enable_vpc         = var.enable_vpc
  subnet_ids         = var.subnet_ids
  security_group_ids = var.security_group_ids

  tags = var.tags
}
