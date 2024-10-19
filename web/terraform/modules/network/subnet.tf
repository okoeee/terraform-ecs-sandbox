
resource "aws_subnet" "public_a" {
  vpc_id = aws_vpc.ecr_sandbox.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "public_c" {
  vpc_id = aws_vpc.ecr_sandbox.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1c"
}
