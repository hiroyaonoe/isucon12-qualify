variable "server_instance_type" {
  description = "server instance type"
  type        = string
  default     = "t2.micro"
}

variable "benchmark_instance_type" {
  description = "benchmark instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "https://github.com/matsuu/aws-isucon"
  type        = string
}

variable "allow_ssh_cidr" {
  description = "sshを許可するIPアドレス"
  type        = string
}

variable "project_name" {
  description = "project name"
  type        = string
}
