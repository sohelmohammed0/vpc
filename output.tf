output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnet_ids" {
  value = aws_subnet.this[*].id
}

output "subnet_cidrs" {
  value = aws_subnet.this[*].cidr_block
}
