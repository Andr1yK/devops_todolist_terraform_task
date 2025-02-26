#!/bin/bash

# Script to silently install and start the todo web app on the virtual machine.
# Note that all commands bellow are without sudo - that's because extention mechanism
# runs scripts under root user.

# install system updates and isntall python3-pip package using apt. '-yq' flags are
# used to suppress any interactive prompts - we won't be able to confirm operation
# when running the script as VM extention.
apt-get update -yq
apt-get install python3-pip python3.12-venv git -yq

# Create a directory for the app and download the files.
mkdir /app
# make sure to uncomment the line bellow and update the link with your GitHub username
git clone https://github.com/Andr1yk/devops_todolist_terraform_task.git
cp -r devops_todolist_terraform_task/app/* /app

chown -R ubuntu:ubuntu /app
chmod -R 755 /app

# Navigate to the /app directory
cd /app

# Create a virtual environment
python3 -m venv /app/venv

# Activate the virtual environment
source /app/venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# create a service for the app via systemctl and start the app
mv /app/todoapp.service /etc/systemd/system/
systemctl daemon-reload
systemctl start todoapp
systemctl enable todoapp
