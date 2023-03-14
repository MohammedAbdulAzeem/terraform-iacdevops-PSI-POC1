resource "aws_vpc" "psi_vpc" {
  cidr_block = "10.0.0.0/16"  # Change to your preferred CIDR block

  tags = {
    Name = "PSI_VPC"
  }
}

#Create internet gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.psi_vpc.id
}

/*
variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
} */

resource "aws_subnet" "subnet" {
  #count = length(var.availability_zones)
   count = 4
   cidr_block = "10.0.${count.index + 1}.0/24"
   vpc_id = aws_vpc.psi_vpc.id

   availability_zone = data.aws_availability_zones.available.names[count.index]

   tags = {
     Name = "subnet-${count.index + 1}"
   }
}

data "aws_availability_zones" "available" {
  state = "available"
}
# Attach the network interface to instance 1 only
/*
resource "aws_network_interface_attachment" "eni_attach" {
  instance_id = aws_instance.cricket[count.index]
  network_interface_id = aws_network_interface.eni.id
} */