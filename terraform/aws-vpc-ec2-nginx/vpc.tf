# Create a VPC with a specific CIDR block and tags
resource "aws_vpc" "vp-terraform-test" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "vp-terraform-test"
  }
}

# Create a subnet within the VPC - public
resource "aws_subnet" "subnet-public-terraform" {
  vpc_id     = aws_vpc.vp-terraform-test.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-public-terraform"
  }
}

# Create a subnet within the VPC - private
resource "aws_subnet" "subnet-private-terraform" {
  vpc_id     = aws_vpc.vp-terraform-test.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "subnet-private-terraform"
  }
}

# Create an Internet Gateway for the VPC
resource "aws_internet_gateway" "test-igw-terraform" {
  vpc_id = aws_vpc.vp-terraform-test.id

  tags = {
    Name = "test-igw-terraform"
  }
}

# route table
resource "aws_route_table" "test-toute-table-terraform" {
  vpc_id = aws_vpc.vp-terraform-test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-igw-terraform.id
  }

  tags = {
    Name = "test-toute-table-terraform"
  }
}

# Associate the route table with the public subnet
resource "aws_route_table_association" "public-subnet-association" {
  subnet_id      = aws_subnet.subnet-public-terraform.id
  route_table_id = aws_route_table.test-toute-table-terraform.id
}
