terraform {
  cloud {
    organization = "emr-serverless"
    workspaces {
      name = "emr-serverless-dev"
    }
  }
}
