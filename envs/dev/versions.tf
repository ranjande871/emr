terraform {
  required_version = ">= 1.6.0"

  cloud {
    organization = "emr-serverless"
    workspaces {
      name = "emr-serverless-dev"
    }
  }
}
