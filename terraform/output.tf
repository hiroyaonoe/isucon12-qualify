output "benchmark_public_ip" {
  value     = local.enable ? aws_instance.benchmark[0].public_ip : null
  sensitive = true
}

output "server1_public_ip" {
  value     = local.enable ? aws_instance.server1[0].public_ip : null
  sensitive = true
}

output "server2_public_ip" {
  value     = local.enable ? aws_instance.server2[0].public_ip : null
  sensitive = true
}

output "server3_public_ip" {
  value     = local.enable ? aws_instance.server3[0].public_ip : null
  sensitive = true
}

output "enable" {
  value     = local.enable
  sensitive = false
}
