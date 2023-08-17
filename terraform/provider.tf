provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      ManagedBy = "Terraform"
      Project   = local.project_name
    }
  }
}

terraform {
  backend "s3" {
    bucket = "hiroyaonoe-isucon12q-tfstate"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}
