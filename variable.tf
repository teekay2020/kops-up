##### if you are not using existing vpc
variable "vpc_id" {
  default     =  "vpc-70303314"
}

variable use_default {
  default = "true"
}


variable "vpc_cidr_block" {
  default     =  "172.31.0.0/20"
}


variable "subnet_id" {
  default     =  "subnet-9cf7e2f8"
}

variable "key_name" {
  default     =  "kubenew1"
}

variable "associate_toolbox_with_public_ip_address" {
  default     =  "true"
}

variable "cluster_name" {
  default     = "clusters.dev.brownsugarmua90.co.uk"
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
  default     = "brownsugarmua90.co.uk"
}

variable "cluster_state_s3" {
  default     = "cluster1.brownsugarmua90.co.uk"
}

