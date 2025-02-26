variable "subnet_id" {
  description = "The ID of the subnet to create the network interface in"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the network interface"
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "instance_size" {
  description = "The size of the instance"
  type        = string
}
