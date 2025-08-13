resource "aws_instance" "public_ec2" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet-public-terraform.id

  associate_public_ip_address = true 

  key_name = "study-aws" 

  user_data = <<-EOF
              #!/bin/bash
              apt update
              apt install apache2 -y
              EOF

  tags = {
    Name = "public_ec2"
  }

  vpc_security_group_ids = [aws_security_group.public_sg.id]
}
