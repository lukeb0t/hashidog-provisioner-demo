
output "aws_vpn_gateway_id" {
  description = "The ID of the VPN Gateway"
  value       = module.vpc.vgw_id
}

output "private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "default_route_table_id" {
  value = module.vpc.vpc_main_route_table_id
}

output "private_sub_cidrs" {
  value = var.private_sub_cidrs
}

output "public_sub_cidrs" {
  value = var.public_sub_cidrs
}

output "keypair_pem" {
  value     = tls_private_key.hashidog.private_key_pem
  sensitive = true
}

output "hashidog_public_ip" {
  value = aws_instance.hashidog[*].public_ip
}

output "hashidog_private_ip" {
  value = aws_instance.hashidog[*].private_ip
}

output "hashidog_sg_id" {
  value = aws_security_group.hashidog.id
}

output "webapp_url" {
  value = aws_eip.hashidog[*].public_dns
}