terraform {
  backend "s3" {
    bucket         = "tu-nombre-terraform-state"
    key            = "prod/terraform.tfstate" #  ruta a 'prod'
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

