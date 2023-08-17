locals {
  enable                  = true # 使わない時はfalseに(必要ならamiとっておく)
  project_name            = "isucon12q"
  ami                     = "ami-05c5b59deed48f66b"
  benchmark_instance_type = "t2.micro" # "c5.xlarge"
  server_instance_type    = "t2.micro" # "c5.large"
}

resource "aws_instance" "server1" {
  count                  = local.enable ? 1 : 0
  ami                    = local.ami
  vpc_security_group_ids = [aws_security_group.isucon_allow_subnet.id, aws_security_group.isucon_allow_ssh.id]
  instance_type          = local.server_instance_type
  subnet_id              = aws_subnet.isucon.id
  private_ip             = "192.168.0.11"
  user_data              = file("${path.module}/init_instance.sh")

  tags = {
    Name    = "${local.project_name}-server1"
    Project = local.project_name
  }

  ebs_optimized = "true"
  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    delete_on_termination = true
    tags = {
      Name    = "${local.project_name}-server1-ebs"
      Project = local.project_name
    }
  }
}

resource "aws_instance" "server2" {
  count                  = local.enable ? 1 : 0
  ami                    = local.ami
  vpc_security_group_ids = [aws_security_group.isucon_allow_subnet.id, aws_security_group.isucon_allow_ssh.id]
  instance_type          = local.server_instance_type
  subnet_id              = aws_subnet.isucon.id
  private_ip             = "192.168.0.12"
  user_data              = file("${path.module}/init_instance.sh")

  tags = {
    Name    = "${local.project_name}-server2"
    Project = local.project_name
  }

  ebs_optimized = "true"
  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    delete_on_termination = true
    tags = {
      Name    = "${local.project_name}-server1-ebs"
      Project = local.project_name
    }
  }
}

resource "aws_instance" "server3" {
  count                  = local.enable ? 1 : 0
  ami                    = local.ami
  vpc_security_group_ids = [aws_security_group.isucon_allow_subnet.id, aws_security_group.isucon_allow_ssh.id]
  instance_type          = local.server_instance_type
  subnet_id              = aws_subnet.isucon.id
  private_ip             = "192.168.0.13"
  user_data              = file("${path.module}/init_instance.sh")

  tags = {
    Name    = "${local.project_name}-server3"
    Project = local.project_name
  }

  ebs_optimized = "true"
  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    delete_on_termination = true
    tags = {
      Name    = "${local.project_name}-server1-ebs"
      Project = local.project_name
    }
  }
}

resource "aws_instance" "benchmark" {
  count                  = local.enable ? 1 : 0
  ami                    = local.ami
  vpc_security_group_ids = [aws_security_group.isucon_allow_subnet.id, aws_security_group.isucon_allow_ssh.id]
  instance_type          = local.benchmark_instance_type
  subnet_id              = aws_subnet.isucon.id
  private_ip             = "192.168.0.14"
  user_data              = file("${path.module}/init_instance.sh")

  tags = {
    Name    = "${local.project_name}-benchmark"
    Project = local.project_name
  }

  ebs_optimized = "true"
  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    delete_on_termination = true
    tags = {
      Name    = "${local.project_name}-server1-ebs"
      Project = local.project_name
    }
  }
}

resource "aws_security_group" "isucon_allow_subnet" {
  name   = "isucon_allow_subnet"
  vpc_id = aws_vpc.isucon.id
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.isucon.cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "${local.project_name}-sg-subnet"
    Project = local.project_name
  }
}

resource "aws_security_group" "isucon_allow_ssh" {
  name   = "isucon_allow_ssh"
  vpc_id = aws_vpc.isucon.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allow_ssh_cidr]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "${local.project_name}-sg-ssh"
    Project = local.project_name
  }
}
