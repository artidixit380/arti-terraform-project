
output "arn" {
  value = aws_instance.new_instance.arn
}

output "public_ip" {
  value = aws_instance.new_instance.public_ip
}
