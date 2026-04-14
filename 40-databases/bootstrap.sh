#!/bin/bash
# This script is used to bootstrap the databases module of the roboshop infrastructure
# It will create the necessary resources for the databases module
# bootstrap.sh
# ============
# 1. install ansible
# 2. configure it using playbooks
# 3. copy this script to mongodb
# 4. execute through remote-exec


dnf install ansible -y
