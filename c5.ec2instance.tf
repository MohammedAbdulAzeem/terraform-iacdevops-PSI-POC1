# Declare the EC2 instance
# Launch EC2 instances with appropriate names
resource "aws_instance" "cricket" {
  count = local.num_instances[var.deployment_stage]
  # count = 1

  ami           = "ami-006dcf34c09e50022"  
  instance_type = "t2.micro"               
  key_name      = "first-instance"            

  availability_zone = data.aws_availability_zones.available.names[count.index]  # Select the first AZ

  subnet_id = aws_subnet.subnet[count.index].id
  vpc_security_group_ids = [aws_security_group.psi_security_group.id]
  
  tags = {
    Name            = "${local.instance_name_prefix[var.deployment_stage]}_${count.index + 1}"
    #Name = "subnet-${count.index + 1}"
    DeploymentStage = var.deployment_stage
  }
}

#data "aws_availability_zones" "available" {}

/*
output "cricket" {
  value = aws_instance.cricket.public_ip[count.index + 1] 
} */