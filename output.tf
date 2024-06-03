output "vpc_id" {
    value = aws_vpc.JuneVpc.id
}

output "PrivateSunet_id" {
    value = aws_subnet.JunePrivateSubnet1.id
}

output "PublicSubnet_id" {
    value = aws_subnet.JunePublicSubnet1.id
}

output "timestamp" {
    value = local.time
  
}

output "eip" {
    value = aws_eip.eip
  
}

output "nat_gateway" {
    value = aws_nat_gateway.June_NGW.id
  
}

output "internet_gateway" {
    value = aws_internet_gateway.June_IGW.id
  
}