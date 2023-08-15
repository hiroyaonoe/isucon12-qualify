resource "aws_instance" "server1" {
  ami                    = var.ami
  vpc_security_group_ids = [aws_security_group.isucon_allow_subnet.id, aws_security_group.isucon_allow_ssh.id]
  instance_type          = var.server_instance_type
  subnet_id              = aws_subnet.isucon.id
  private_ip             = "192.168.0.11"
  user_data              = file("${path.module}/init_instance.sh")

  tags = {
    Name    = "${var.project_name}-server1"
    Project = var.project_name
  }
}

resource "aws_instance" "server2" {
  ami                    = var.ami
  vpc_security_group_ids = [aws_security_group.isucon_allow_subnet.id, aws_security_group.isucon_allow_ssh.id]
  instance_type          = var.server_instance_type
  subnet_id              = aws_subnet.isucon.id
  private_ip             = "192.168.0.12"
  user_data              = file("${path.module}/init_instance.sh")

  tags = {
    Name    = "${var.project_name}-server2"
    Project = var.project_name
  }
}

resource "aws_instance" "server3" {
  ami                    = var.ami
  vpc_security_group_ids = [aws_security_group.isucon_allow_subnet.id, aws_security_group.isucon_allow_ssh.id]
  instance_type          = var.server_instance_type
  subnet_id              = aws_subnet.isucon.id
  private_ip             = "192.168.0.13"
  user_data              = file("${path.module}/init_instance.sh")

  tags = {
    Name    = "${var.project_name}-server3"
    Project = var.project_name
  }
}

resource "aws_instance" "benchmark" {
  ami                    = var.ami
  vpc_security_group_ids = [aws_security_group.isucon_allow_subnet.id, aws_security_group.isucon_allow_ssh.id]
  instance_type          = var.benchmark_instance_type
  subnet_id              = aws_subnet.isucon.id
  private_ip             = "192.168.0.14"
  user_data              = file("${path.module}/init_instance.sh")

  tags = {
    Name    = "${var.project_name}-benchmark"
    Project = var.project_name
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
    Name    = "${var.project_name}-sg-subnet"
    Project = var.project_name
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
    Name    = "${var.project_name}-sg-ssh"
    Project = var.project_name
  }
}

output "benchmark_public_ip" {
  value     = aws_instance.benchmark.public_ip
  sensitive = true
}

output "server1_public_ip" {
  value     = aws_instance.server1.public_ip
  sensitive = true
}

output "server2_public_ip" {
  value     = aws_instance.server2.public_ip
  sensitive = true
}

output "server3_public_ip" {
  value     = aws_instance.server3.public_ip
  sensitive = true
}
