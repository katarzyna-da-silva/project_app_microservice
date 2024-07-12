#!/bin/bash

TERRAFORM_DIR="/home/z390/Bureau/project_app_microservice/dev/terraform/"

echo "Updating system"
sudo apt-get update -y && sudo apt-get upgrade -y

cd "$TERRAFORM_DIR" || { echo "Terraform directory not found"; exit 1; }

echo "Starting Terraform"
terraform plan  ## apply -auto-approve

echo "Terraform ok."

