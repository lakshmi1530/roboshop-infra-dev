#!/bin/bash
#we are creating 50GB root disk, but inly 20GB is partitioned
#Remining 30GB is unpartitioned, we need to extend using below command


# Install required tools
sudo yum install -y cloud-utils-growpart

# Extend partition
sudo growpart /dev/nvme0n1 4

# Extend LVM using ALL free space (recommended)
sudo lvextend -l +100%FREE /dev/mapper/RootVG-homeVol

# Resize filesystem
sudo xfs_growfs /home

# Install Terraform
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum install -y terraform