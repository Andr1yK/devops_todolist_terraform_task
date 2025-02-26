variable "region" {
  type        = string
  description = "The AWS region to deploy the resources"
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC"
}

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "subnet_cidr_block" {
  type        = string
  description = "The CIDR block for the subnet"
}

variable "defaultsg" {
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  description = "The default security group rules"
}


variable "vm_name" {
  type        = string
  description = "The name of the VM"
}

variable "instance_size" {
  type        = string
  description = "The size of the instance"
}
