terraform {
  backend "s3" {
    bucket = "marcelo-devops-challenge"
    key    = "infra/terraform.tfstate"
    region = "us-west-2"

    # dynamodb_table = "devops-challenge-lock-table"
    encrypt = true
  }
}