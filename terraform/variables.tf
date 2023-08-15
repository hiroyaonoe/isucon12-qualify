variable "webapp_instance_type" {
  description = "webapp instance type"
  type        = string
  default     = "t2.micro"
}

variable "bench_instance_type" {
  description = "bench instance type"
  type        = string
  default     = "t2.micro"
}

variable "isucon11q_ami" {
  description = "https://github.com/matsuu/aws-isucon"
  type        = string
  default     = "ami-01730fadc0a1d1e1c"
}

variable "allow_ssh_cidr" {
  description = "sshを許可するIPアドレス"
  type        = string
}
