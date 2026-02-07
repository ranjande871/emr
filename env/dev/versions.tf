terraform {
  required_version = ">= 1.6.0"

  cloud {
    organization = "YOUR_TFC_ORG"
    workspaces {
      name = "emr-serverless-dev"
    }
  }
}
