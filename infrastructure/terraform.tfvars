region            = "eu-central-1"
vpc_name          = "vpc"
vpc_cidr_block    = "10.0.0.0/16"
subnet_cidr_block = "10.0.0.0/24"
defaultsg = {
  ssh = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  http = {
    from_port   = 80
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  https = {
    from_port   = 443
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
vm_name       = "matebox"
instance_size = "t2.micro"
