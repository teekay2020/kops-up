resource "aws_instance" "toolbox" {
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  tags                        = "${var.tags}"
  key_name                    = "${var.key_name}"
  security_groups             = ["${var.security_group_ids}"]
  associate_public_ip_address = "${var.associate_public_ip_address}"
  subnet_id                   = "${var.subnet_id}"
  user_data                   = "${var.user_data}"
  iam_instance_profile        = "${var.iam_instance_profile}" 

  #provisioner "file" {
  #  content = "${var.deregistration_script}"
  #  destination = "/etc/config.d/config.json"
  #}
}
