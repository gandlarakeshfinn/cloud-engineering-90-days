provider "aws" {
  region = "ap-south-1"
}

# 1. The Custom VPC
resource "aws_vpc" "custom_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = { Name = "Rakesh-VPC" }
}

# 2. Public Subnet (The Courtyard)
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true # THIS makes it public
  tags                    = { Name = "Rakesh-Public-Subnet" }
}

# 3. Private Subnet (The Vault)
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = false # THIS makes it private
  tags                    = { Name = "Rakesh-Private-Subnet" }
}

# 4. Internet Gateway (Front Door)
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.custom_vpc.id
}

# 5. Route Table for Public Subnet ONLY
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.custom_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
