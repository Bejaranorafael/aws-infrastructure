terraform {
  backend "s3" {
    bucket         = "mi-terraform-state-2026-unique-id"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks" # Evita colisiones de escritura
    encrypt        = true
  }
}

