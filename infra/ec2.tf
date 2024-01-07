data "aws_ami" "ubuntu"{
    most_recent = true
}

resource "aws_instance" "terraform" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.sg.id] 
  associate_public_ip_address = true

user_data = file("./install.tpl")

   tags = {
     Name = "${var.env_prefix}-ec2"
   }

}