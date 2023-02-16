#----Networking/outputs----
output "vpc_id" {
  value = aws_vpc.mtc_vpc.id
}


output "public_sg" {
  value = aws_security_group.mtc_sg["public"].id
}


output "public_subnets" {
  value = aws_subnet.mtc_public_subnet.*.id
}


output "private_subnets" {
  value = aws_subnet.mtc_private_subnet.*.id
}