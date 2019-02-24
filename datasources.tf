data "aws_ami" "ubuntu" {
  most_recent = true
    filter {
      name   = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
    }

    filter {
      name   = "virtualization-type"
      values = ["hvm"]
    }

    owners = ["099720109477"] # Canonical
}

#data "terraform_remote_state" "deploy" {
#    backend = "s3"
#    config {
#      bucket = "olu-kops-auto-create"
#      key    = "terraform.tfstate"
#      region = "eu-west-1"
#    }
#}

provider "aws" {
    region     = "eu-west-1"
}

data "template_file" "init" {
  template = "${file("bootstrap.sh.tpl")}"

  vars {
    master_ec2_type    = "${var.master_ec2_type}"
    node_ec2_type      = "${var.node_ec2_type}"
    node_count         = "${var.node_count}"
    master_count       = "${var.master_count}"
    cluster_name       = "${var.cluster_name}"
    cluster_state_s3   = "${var.cluster_state_s3}"
    cluster_dns_zone   = "${var.cluster_dns_zone}"
    cluster_networking = "${var.cluster_networking}"
    zones              = "${var.zones}"
  }
}

data "template_file" "deregistration" {
  template = "${file("deresgister_kops.tpl")}"

  vars {
    cluster_name = "${var.cluster_name}"
    cluster_state_s3 = "${var.cluster_state_s3}"
  }
}
