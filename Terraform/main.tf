resource "aws_security_group" "ASC_SG" {
  name = "ASG_SG"
  description = "Security Group inbounds traffic to Docker container and SSH"
  vpc_id = "vpc-017f8b31653169d1f"
}

resource "aws_instance" "ASC_Instance" {
  ami           = "ami-0d191299f2822b1fa"
  instance_type = "t2.micro"
  subnet_id     = "subnet-01df6f4eb4ec8187d"
  security_groups = [aws_security_group.ASC_SG]
  tags = {
    Name = "ASC_Instance"
  }
}
