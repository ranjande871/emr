resource "aws_emrserverless_application" "emr_serverless_app" {
  name          = var.application_name
  release_label = var.release_label
  type          = var.application_type

  maximum_capacity {
    cpu    = var.max_cpu
    memory = var.max_memory
  }

  # Existing VPC networking
  network_configuration {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  # Auto start/stop (best practice for cost)
  auto_start_configuration {
    enabled = var.enable_auto_start
  }

  auto_stop_configuration {
    enabled              = var.enable_auto_stop
    idle_timeout_minutes = var.idle_timeout_minutes
  }

  # Monitoring (Registry-aligned)
  dynamic "monitoring_configuration" {
    for_each = var.enable_monitoring ? [1] : []
    content {
      dynamic "cloudwatch_logging_configuration" {
        for_each = var.enable_cloudwatch_logs ? [1] : []
        content {
          enabled                = true
          log_group_name         = var.cloudwatch_log_group_name
          log_stream_name_prefix = var.cloudwatch_log_stream_prefix
        }
      }

      dynamic "s3_monitoring_configuration" {
        for_each = var.s3_log_uri != null ? [1] : []
        content {
          log_uri = var.s3_log_uri
        }
      }
    }
  }

  tags = var.tags
}
