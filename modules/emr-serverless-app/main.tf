resource "aws_cloudwatch_log_group" "this" {
  count             = var.enable_cloudwatch_logs ? 1 : 0
  name              = "/aws/emr-serverless/${var.name}"
  retention_in_days = var.log_retention_days
}

resource "aws_emrserverless_application" "this" {
  name          = var.name
  release_label = var.release_label
  type          = var.type

  initial_capacity {
    initial_capacity_type = "Driver"
    initial_capacity_config {
      worker_count = var.driver_worker_count
      worker_configuration {
        cpu    = var.driver_cpu
        memory = var.driver_memory
      }
    }
  }

  initial_capacity {
    initial_capacity_type = "Executor"
    initial_capacity_config {
      worker_count = var.executor_worker_count
      worker_configuration {
        cpu    = var.executor_cpu
        memory = var.executor_memory
      }
    }
  }

  maximum_capacity {
    cpu    = var.max_cpu
    memory = var.max_memory
  }

  dynamic "monitoring_configuration" {
    for_each = var.enable_cloudwatch_logs ? [1] : []
    content {
      cloud_watch_monitoring_configuration {
        log_group_name = aws_cloudwatch_log_group.this[0].name
      }
    }
  }

  dynamic "network_configuration" {
    for_each = var.enable_vpc ? [1] : []
    content {
      subnet_ids         = var.subnet_ids
      security_group_ids = var.security_group_ids
    }
  }

  tags = var.tags
}
