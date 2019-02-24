##### if you are not using existing vpc
variable "vpc_id" {
  default     =  "vpc-2348b644"
}

variable use_default {
  default = "true"
}


variable "vpc_cidr_block" {
  default     =  "10.0.0.0/16"
}


variable "subnet_id" {
  default     =  "subnet-9d8347d4"
}

variable "key_name" {
#  default     =  "jenkins_key4"
}

variable "associate_toolbox_with_public_ip_address" {
  default     =  "true"
}

variable "cluster_name" {
#  default     = "olus.shegoj.com"
}

variable "master_ec2_type" {
  default     = "t2.micro"
}
variable "node_ec2_type" {
  default     = "t2.micro"
}

variable "node_count" {
  default     = "2"
}

variable "master_count" {
  default     = "1"
}

variable "cluster_networking" {
  default     = "kubenet"
}

variable "zones" {
  default     = "eu-west-1a"
}

variable "cluster_dns_zone" {
#  default     = "shegoj.com"
}

variable "cluster_state_s3" {
#  default     = "kops101.shegoj.com"
}

