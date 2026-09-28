output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "VPC CIDR"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id
  ]
}

output "private_app_subnet_ids" {
  description = "Private application subnet IDs"
  value = [
    aws_subnet.private_app_a.id,
    aws_subnet.private_app_b.id
  ]
}

output "private_db_subnet_ids" {
  description = "Private database subnet IDs"
  value = [
    aws_subnet.private_db_a.id,
    aws_subnet.private_db_b.id
  ]
}

output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = aws_nat_gateway.main.id
}

output "app_instance_ids" {
  description = "Application EC2 instance IDs"
  value = [
    aws_instance.app_a.id,
    aws_instance.app_b.id
  ]
}

output "app_private_ips" {
  description = "Private IP addresses of application servers"
  value = [
    aws_instance.app_a.private_ip,
    aws_instance.app_b.private_ip
  ]
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS name"
  value       = aws_lb.app.dns_name
}

output "rds_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.main.address
}

output "rds_port" {
  description = "RDS port"
  value       = aws_db_instance.main.port
}