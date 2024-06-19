#Step2: Create a public subnet
resource "aws_subnet" "publicsubnet" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

#Step3: Create a private subnet
resource "aws_subnet" "privatesubnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
}