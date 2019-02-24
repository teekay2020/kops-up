variable "name" {
  description = "resource prefix name"
}

variable "instance_count" {
  description = "Number of instances to launch"
  default     = 1
}

variable "ami" {
  description = "ID of AMI to use for the instance"
}

variable "instance_type" {
  description = "The type of instance to start"
  default     = "t2.micro"
}

variable "key_name" {
  description = "The key name to use for the instance"
  default     = ""
}


variable "security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = "list"
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
}

variable "associate_public_ip_address" {
  description = "If true, the EC2 instance will have associated public IP address"
  default     = false
}

variable "deregistration_script" {
  description = "Deregistration script"
}
variable "user_data" {
  description = "bootstrap the node"
}

variable "iam_instance_profile" {
  description = "The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile."
  default     = ""
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  default     = {
    Name = "kops-toolbox"
    Environment = "AGS-TRAINING"
  }

}
