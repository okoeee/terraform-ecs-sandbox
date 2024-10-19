
output "vpc_id" {
  value = aws_vpc.ecr_sandbox.id
}

output "subnet_public_id_a" {
  value = aws_subnet.public_a.id
}

output "subnet_public_id_c" {
  value = aws_subnet.public_c.id
}
