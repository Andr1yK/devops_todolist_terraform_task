output "instance_id" {
  value = aws_instance.instance.id
}

output "public_ip" {
  value = aws_eip.eip.public_ip
}
