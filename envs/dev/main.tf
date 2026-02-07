resource "aws_cloudwatch_log_group" "this" {
  count             = var.enable_cloudwatch_logs ? 1 : 0
  name              = "/aws/emr-serverless/${var.name}"
  retention_in_days = var.log_retention_days
}

resource "aws_emrserverless_application" "this" {
  name          = var.name
  release_label = var.release_label
  type          = var.type

  # NOTE:
  # Removing initial_capacity avoids consuming concurrent vCPU quota during
  # application creation. Capacity will be allocated when jobs are submitted.
  # If you later increase quota, you can re-add initial_capacity.

  maximum_capacity {
    cpu    = var.max_cpu
    memory = var.max_memory
  }

  # NOTE:
  # Your current AWS provider schema does NOT support application-level
  # monitoring_configuration { cloud_watch_monitoring_configuration { ... } }.
  # We'll configure CloudWatch logging at the JOB RUN level later (or upgrade provider).

  dynamic "network_configuration" {
    for_each = var.enable_vpc ? [1] : []
    content {
      subnet_ids         = var.subnet_ids
      security_group_ids = var.security_group_ids
    }
  }

  tags = var.tags
}
