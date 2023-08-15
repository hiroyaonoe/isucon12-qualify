resource "aws_vpc" "isucon" {
  cidr_block           = "192.168.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name    = "${var.project_name}-vpc"
    Project = var.project_name
  }
}

resource "aws_subnet" "isucon" {
  vpc_id                  = aws_vpc.isucon.id
  cidr_block              = "192.168.0.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "${var.project_name}-subnet"
    Project = var.project_name
  }
}

resource "aws_internet_gateway" "isucon" {
  vpc_id = aws_vpc.isucon.id

  tags = {
    Name    = "${var.project_name}-igw"
    Project = var.project_name
  }
}

resource "aws_route_table" "isucon" {
  vpc_id = aws_vpc.isucon.id

  tags = {
    Name    = "${var.project_name}-rtb"
    Project = var.project_name
  }
}

resource "aws_route" "isucon_public" {
  route_table_id         = aws_route_table.isucon.id
  gateway_id             = aws_internet_gateway.isucon.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "isucon_public" {
  subnet_id      = aws_subnet.isucon.id
  route_table_id = aws_route_table.isucon.id
}
