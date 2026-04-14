#!/bin/bash
#we are creating 50GB root disk, but inly 20GB is partitioned
#Remining 30GB is unpartitioned, we need to extend using below command

growpart /dev/nvme0n1 4
lvextend -r -L +30GB /dev/mapper/RootVG-homeVol
xfs_growfs /home

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform