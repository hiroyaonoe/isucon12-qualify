locals {
  s3-bucket-name = "hiroyaonoe-${local.project_name}-tfstate"
}

resource "aws_s3_bucket" "tfstate" {
  bucket = local.s3-bucket-name

  tags = {
    Name = "${local.project_name}-s3-tfstate"
  }
}
