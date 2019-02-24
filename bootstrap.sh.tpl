#!/bin/bash
#download kops, kubectl
wget -O kubectl  https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kubectl
sleep 5
wget -O kops  https://github.com/kubernetes/kops/releases/download/1.11.0/kops-linux-amd64
chmod +x kops kubectl
sudo mv kops kubectl /bin
cd /tmp
ssh-keygen -f id_rsa -t rsa -N ''


echo "kops create cluster --name=${cluster_name} --zones=eu-west-1a --node-count=${node_count}  --master-count=${master_count} --node-size=${node_ec2_type} --master-size=${master_ec2_type}  --dns-zone=${cluster_dns_zone} --state=s3://{cluster_state_s3} --ssh-public-key=/tmp/id_rsa.pub --networking=${cluster_networking} --yes"

   kops create cluster --name="${cluster_name}" --zones="${zones}" \
  --node-count="${node_count}"  --master-count="${master_count}" --node-size="${node_ec2_type}" --master-size="${master_ec2_type}" \
  --dns-zone="${cluster_dns_zone}" --state=s3://"${cluster_state_s3}" --ssh-public-key=/tmp/id_rsa.pub \
  --networking="${cluster_networking}" --zones="${zones}" --yes

chown ubuntu:ubuntu id_rsa*
cp id_rsa* /home/ubuntu/.ssh/
