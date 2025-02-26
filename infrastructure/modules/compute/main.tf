locals {
  vm_name                = var.vm_name
  network_interface_name = "${var.vm_name}-ni"
  key_name               = "linuxboxsshkey"
}

resource "aws_network_interface" "network_interface" {
  subnet_id       = var.subnet_id
  security_groups = [var.security_group_id]

  tags = {
    Name = local.network_interface_name
  }
}

data "aws_ami" "ubuntu_24_04" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["amazon"] // Canonical
}

resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key" {
  key_name   = local.key_name
  public_key = tls_private_key.key.public_key_openssh
}

resource "aws_instance" "instance" {
  ami           = data.aws_ami.ubuntu_24_04.id
  instance_type = var.instance_size

  network_interface {
    network_interface_id = aws_network_interface.network_interface.id
    device_index         = 0
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = tls_private_key.key.private_key_pem
    host        = aws_network_interface.network_interface.private_ip
  }

  user_data = file("${path.module}/install-app.sh")

  tags = {
    Name = var.vm_name
  }
}

resource "aws_eip" "eip" {
  network_interface = aws_network_interface.network_interface.id
}
