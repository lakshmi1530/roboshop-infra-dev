#!/bin/bash
# This script is used to bootstrap the databases module of the roboshop infrastructure
# It will create the necessary resources for the databases module
# bootstrap.sh
# ============
# 1. install ansible
# 2. configure it using playbooks
# 3. copy this script to mongodb
# 4. execute through remote-exec

component=$1
environment=$2
dnf install ansible -y

cd /home/ec2-user
git clone https://github.com/lakshmi1530/ansible-roboshop-roles-tf.git

cd ansible-roboshop-roles-tf
git pull
ansible-playbook -e component=$component -e env=$environment roboshop.yaml
