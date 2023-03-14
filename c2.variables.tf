# Input Variables
# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  #default = us-east-1
} 

variable "ec2_ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-006dcf34c09e50022" # Amazon2 Linux AMI ID
}

variable "ec2_instance_count" {
  description = "EC2 Instance Count"
  type        = number
  default     = 1
}

variable "deployment_stage" {
  default = "DEV"
}

locals {
  num_instances = {
    DEV  = 1
    TEST = 2
    PROD = 4
  }

instance_name_prefix = {
    DEV  = "PSI_Cricket_Dev"
    TEST = "PSI_Cricket_Test"
    PROD = "PSI_Cricket_Prod"
  }
}
