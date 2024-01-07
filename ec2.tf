data "aws_ami" "ubuntu"{
    most_recent = true
}

resource "aws_instance" "terraform" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.sg.id] 
  associate_public_ip_address = true

  user_data = <<-EOF
  #!/bin/bash
  echo "Hello, World!!"
  sudo apt-get update
  sudo apt-get install -y docker.io
  sudo usermod -aG docker ubuntu
  sudo systemctl restart docker
  docker run -d --p 8080:80 nginx
  EOF

   tags = {
     Name = "${var.env_prefix}-ec2"
   }

}