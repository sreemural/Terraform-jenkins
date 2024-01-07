
resource "aws_vpc" "vpc1" {
    cidr_block = var.cidr_block
  
     tags = {
     Name = "${var.env_prefix}-vpc1"
   }
}


resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.subnet_cidr_block
    
    tags = {
     Name ="${var.env_prefix}-subnet1"
   }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc1.id
  
  tags = {
     Name ="${var.env_prefix}-igw"
   }

}

resource "aws_default_route_table" "rt" {
   default_route_table_id =  aws_vpc.vpc1.default_route_table_id

    route {
        cidr_block = var.rt_cidr_block
        gateway_id = aws_internet_gateway.igw.id
    }
    
    
  tags = {
     Name ="${var.env_prefix}-rt"
   }

  
}
   