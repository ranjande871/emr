# EMR Serverless IaC (Terraform)

This repo provisions an Amazon EMR Serverless application using Terraform.

## Structure
- `modules/emr-serverless-app/` : reusable module
- `envs/dev/` : dev stack (Terraform Cloud workspace: `emr-serverless-dev`)
- `envs/prod/` : prod stack (Terraform Cloud workspace: `emr-serverless-prod`)

## Usage
- Terraform Cloud (VCS-driven): connect the repo and set working directory to `envs/dev` or `envs/prod`.

## Notes
- Do not commit Terraform state files.
- Use AWS OIDC in Terraform Cloud for authentication (recommended).
