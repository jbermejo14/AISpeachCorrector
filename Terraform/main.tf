resource "aws_security_group" "ASC_SG" {
  name = "ASG_SG"
  description = "Security Group inbounds traffic to Docker container and SSH"
  vpc_id = "vpc-017f8b31653169d1f"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ASC_Instance" {
  ami           = "ami-08a0d1e16fc3f61ea"
  instance_type = "t2.micro"
  subnet_id     = "subnet-01df6f4eb4ec8187d"
  security_groups = [aws_security_group.ASC_SG.id]

  user_data = <<EOF
#!/bin/bash
sudo yum install git -y
sudo yum install docker -y
git clone https://github.com/jbermejo14/AISpeachCorrector.git
EOF

  tags = {
    Name = "ASC_Instance"
  }
  key_name = "ASC-keypair"
}
