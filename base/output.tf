output "toolbox_ip" {
  description = "public IP"
  value       = "${aws_instance.toolbox.public_ip}"
}
