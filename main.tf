resource "aws_vpc" "JuneVpc" {
    cidr_block = var.VpcCidr
    tags = {Name = "JuneVpc"}
}



resource "aws_subnet" "JunePrivateSubnet1" {
    vpc_id = aws_vpc.JuneVpc.id
    cidr_block = var.PrivateSubnetCidr
    tags = merge(local.Subnet_tags, {Name = "Private_Subnet_1"})
}
resource "aws_eip" "eip" {
    domain = "vpc"
  
}
resource "aws_nat_gateway" "June_NGW" {
    subnet_id = aws_subnet.JunePublicSubnet1.id
    allocation_id = aws_eip.eip.id
    tags = {Name = "June_NGW", timestamp = local.time}
}
resource "aws_route_table" "Private_Route_Table" {
    vpc_id = aws_vpc.JuneVpc.id
    tags = {Name = "June_PrivateRT"}
}
resource "aws_route_table_association" "PrivateAssoc" {
    route_table_id = aws_route_table.Private_Route_Table.id
    subnet_id = aws_subnet.JunePrivateSubnet1.id
}
resource "aws_route" "PrivateRoute" {
    route_table_id = aws_route_table.Private_Route_Table.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.June_NGW.id
}




resource "aws_subnet" "JunePublicSubnet1" {
    vpc_id = aws_vpc.JuneVpc.id
    cidr_block = var.PublicSubnetCidr
    tags = merge(local.Subnet_tags, {Name = "Public_Subnet_1"})
}
resource "aws_internet_gateway" "June_IGW" {
    vpc_id = aws_vpc.JuneVpc.id
    tags = { Name = "JuneIGW", timestamp = local.time}
}
resource "aws_route_table" "Public_Route_Table" {
    vpc_id = aws_vpc.JuneVpc.id
    tags = {Name = "June_PublicRT"}
}
resource "aws_route_table_association" "PublicAssoc" {
    route_table_id = aws_route_table.Public_Route_Table.id
    subnet_id = aws_subnet.JunePublicSubnet1.id
}
resource "aws_route" "PublicRoute" {
    route_table_id = aws_route_table.Public_Route_Table.id
    gateway_id = aws_internet_gateway.June_IGW.id
    destination_cidr_block = "0.0.0.0/0"
}
