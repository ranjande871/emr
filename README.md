# EMR Serverless Infrastructure (Terraform)

This repository provisions Amazon EMR Serverless applications using
Terraform modules and Terraform Cloud.

Structure:
- modules/ : reusable Terraform modules
- envs/    : environment-specific stacks (dev, prod)

Authentication:
- Terraform Cloud with AWS OIDC (recommended)

Managed by Terraform.

