variable "defaultsg" {
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  description = "The default security group rules"
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC"
}

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the subnet"
}

variable "subnet_cidr_block" {
  type        = string
  description = "The CIDR block for the subnet"
}
