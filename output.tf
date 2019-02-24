#output "sg" {
#  description = "sg"
#  value       = "${aws_security_group.tool_box_sg.id}"
#}

output "info" {
  description = "info"
  value       ="[ ssh -i ${var.key_name}.pem ubuntu@${module.ec2_toolbox.toolbox_ip}] to log on the box\n       [ kops export kubecfg --name=${var.cluster_name} --state s3://${var.cluster_state_s3}] to update kubectl\n       [tail /var/log/cloud-init-output.log] to investigate issues\n       [ssh -i /tmp/id_rsa admin@api.${var.cluster_name}] to ssh to master node"
}
