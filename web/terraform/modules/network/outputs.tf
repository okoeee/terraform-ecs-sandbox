
output "vpc_id" {
  value = aws_vpc.ecr_sandbox.id
}

output "subnet_public_id" {
  value = aws_subnet.public.id
}
