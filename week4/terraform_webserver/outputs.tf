output "web_server_public_ip" {
  description = "The Public IP address of our automated web server"
  value       = aws_instance.web_server.public_ip
}
