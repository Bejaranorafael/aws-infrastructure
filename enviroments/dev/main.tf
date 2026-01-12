provider "aws" { region = var.region }

module "network" {
  source       = "../../modules/vpc"
  project_name = "demo-dev"
  vpc_cidr     = "10.0.0.0/16"
  subnet_cidr  = "10.0.1.0/24"
}

module "compute" {
  source        = "../../modules/ec2"
  project_name  = "demo-dev"
  instance_type = "t3.micro"
  subnet_id     = module.network.subnet_id
  ami_id        = "ami-0c55b159cbfafe1f0" # Amazon Linux 2023
}

