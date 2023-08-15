resource "aws_instance" "webapp1" {
  ami                    = var.isucon11q_ami
  vpc_security_group_ids = [aws_security_group.sg_allow_subnet.id, aws_security_group.sg_allow_ssh.id]
  instance_type          = var.webapp_instance_type
  subnet_id              = aws_subnet.subnet.id
  private_ip             = "192.168.0.11"
  user_data              = file("${path.module}/init_instance.sh")

  tags = {
    Name = "terraform-webapp1"
  }
}

resource "aws_instance" "webapp2" {
  ami                    = var.isucon11q_ami
  vpc_security_group_ids = [aws_security_group.sg_allow_subnet.id, aws_security_group.sg_allow_ssh.id]
  instance_type          = var.webapp_instance_type
  subnet_id              = aws_subnet.subnet.id
  private_ip             = "192.168.0.12"
  user_data              = file("${path.module}/init_instance.sh")

  tags = {
    Name = "terraform-webapp2"
  }
}

resource "aws_instance" "webapp3" {
  ami                    = var.isucon11q_ami
  vpc_security_group_ids = [aws_security_group.sg_allow_subnet.id, aws_security_group.sg_allow_ssh.id]
  instance_type          = var.webapp_instance_type
  subnet_id              = aws_subnet.subnet.id
  private_ip             = "192.168.0.13"
  user_data              = file("${path.module}/init_instance.sh")

  tags = {
    Name = "terraform-webapp3"
  }
}

resource "aws_instance" "bench" {
  ami                    = var.isucon11q_ami
  vpc_security_group_ids = [aws_security_group.sg_allow_subnet.id, aws_security_group.sg_allow_ssh.id]
  instance_type          = var.bench_instance_type
  subnet_id              = aws_subnet.subnet.id
  private_ip             = "192.168.0.14"
  user_data              = file("${path.module}/init_instance.sh")

  tags = {
    Name = "terraform-bench"
  }
}

resource "aws_security_group" "sg_allow_subnet" {
  name   = "allow_subnet"
  vpc_id = aws_vpc.vpc.id
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.subnet.cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-isucon11q"
  }
}

resource "aws_security_group" "sg_allow_ssh" {
  name   = "allow_ssh"
  vpc_id = aws_vpc.vpc.id
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
    Name = "terraform-isucon11q"
  }
}

output "bench_public_ip" {
  value     = aws_instance.bench.public_ip
  sensitive = true
}

output "webapp1_public_ip" {
  value     = aws_instance.webapp1.public_ip
  sensitive = true
}

output "webapp2_public_ip" {
  value     = aws_instance.webapp2.public_ip
  sensitive = true
}

output "webapp3_public_ip" {
  value     = aws_instance.webapp3.public_ip
  sensitive = true
}
