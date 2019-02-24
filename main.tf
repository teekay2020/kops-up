#===================================================
#=           EC2 Toolbox Instance Profile          =
#===================================================

resource "aws_iam_instance_profile" "toolbox_profile" {
  name = "test_profile"
    role = "${aws_iam_role.cluster-ec2-role.name}"
  }

resource "aws_iam_role" "cluster-ec2-role" {
  name = "run-kops-${var.cluster_name}-role"
  path = "/"

  assume_role_policy = <<EOF
{
"Version": "2012-10-17",
      "Statement": [
          {
              "Action": "sts:AssumeRole",
              "Principal": {
                 "Service": "ec2.amazonaws.com"
              },
              "Effect": "Allow",
              "Sid": ""
          }
      ]
  }
  EOF
  }

#===================================================
#=           ADMIN Policy for EC2 Toolbox          =
#===================================================

#todo  workout the permissions required and create only those

resource "aws_iam_role_policy" "toolbox_policy" {
  name = "ec_toolbox_polcy"
  role = "${aws_iam_role.cluster-ec2-role.id}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF
}


resource "aws_default_subnet" "default_az1" {
  availability_zone = "eu-west-1a"

  tags = {
    Name = "Default subnet for eu-west-1a"
  }
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

data "aws_vpc" "vpc" {
  id = "${var.use_default == "true" ? aws_default_vpc.default.id :  var.vpc_id}"
}

data "aws_subnet_ids" "public" {
  vpc_id = "${data.aws_vpc.vpc.id}"

  tags = {
    Name = "Default subnet for eu-west-1a"
  }
}


resource "aws_security_group"  "tool_box_sg" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  vpc_id      = "${data.aws_vpc.vpc.id}"
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



#===================================================
#=           Module to provision EC2               =
#===================================================

module "ec2_toolbox" {
  source                        = "base"
  name                          = "kops-ec2-toolbox"
  ami                           = "${data.aws_ami.ubuntu.id}"
  security_group_ids            = ["${aws_security_group.tool_box_sg.id}"]
  associate_public_ip_address   = "${var.associate_toolbox_with_public_ip_address}"
  key_name                      = "${var.key_name}"
  subnet_id                     = "${aws_default_subnet.default_az1.id}" 
  iam_instance_profile          = "${aws_iam_instance_profile.toolbox_profile.name}" 
  user_data                     = "${data.template_file.init.rendered}"
  deregistration_script         = "${data.template_file.deregistration.rendered}"
}
