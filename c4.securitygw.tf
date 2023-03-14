# Create a security group for the VPC
resource "aws_security_group" "psi_security_group" {
  name_prefix = "psi_security_group"
  vpc_id = aws_vpc.psi_vpc.id
  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
