module "network" {
  source               = "../../modules/network"
  name                 = var.name_prefix
  vpc_cidr             = var.vpc_cidr
  azs                  = var.azs
  private_subnet_cidrs = var.private_subnet_cidrs
  tags                 = var.tags
}

module "artifacts_s3" {
  source      = "../../modules/emr-serverless-s3"
  bucket_name = "${var.name_prefix}-artifacts-${var.account_id}"
  tags        = var.tags
}

module "logs_s3" {
  source      = "../../modules/emr-serverless-s3"
  bucket_name = "${var.name_prefix}-logs-${var.account_id}"
  tags        = var.tags
}

module "iam" {
  source              = "../../modules/emr-serverless-iam"
  role_name           = "${var.name_prefix}-execution-role"
  artifact_bucket_arn = "arn:aws:s3:::${module.artifacts_s3.bucket_name}"
  log_bucket_arn      = "arn:aws:s3:::${module.logs_s3.bucket_name}"
  tags                = var.tags
}

module "emr_serverless" {
  source           = "../../modules/emr-serverless-app"
  application_name = "${var.name_prefix}-app"
  release_label    = var.release_label
  application_type = var.application_type

  # Keep conservative (quota)
  max_cpu    = var.max_cpu
  max_memory = var.max_memory

  enable_vpc         = true
  subnet_ids         = module.network.private_subnet_ids
  security_group_ids = [module.network.security_group_id]

  tags = var.tags
}

output "emr_serverless_application_id" {
  value = module.emr_serverless.application_id
}

output "emr_serverless_execution_role_arn" {
  value = module.iam.execution_role_arn
}
