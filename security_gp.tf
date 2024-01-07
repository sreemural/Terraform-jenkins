

resource "aws_security_group" "sg" {
  name        = "myapp-sg"
  description = "Example security group for web servers"
  vpc_id = aws_vpc.vpc1.id

  // Ingress rules (inbound traffic)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Egress rules (outbound traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Optional: Tags
  tags = {
    Name = "${var.env_prefix}-sg"
    
  }
}
