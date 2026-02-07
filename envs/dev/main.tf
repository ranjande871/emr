module "emr_serverless" {
  source = "../../modules/emr-serverless-app"

  application_name = "dev-emr-serverless"
  release_label    = var.release_label
  application_type = var.application_type

  max_cpu    = var.max_cpu
  max_memory = var.max_memory

  subnet_ids         = var.existing_subnet_ids
  security_group_ids = var.existing_security_group_ids

  tags = var.tags
}
