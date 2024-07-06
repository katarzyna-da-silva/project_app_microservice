#!/bin/bash

# Install kubectl
echo "Install..."
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --short --client

# unzip
sudo apt-get update
sudo apt-get install -y unzip

# terraform
echo "Install  Terraform..."
wget https://releases.hashicorp.com/terraform/1.9.1/terraform_1.9.1_linux_amd64.zip
unzip terraform_1.9.1_linux_amd64.zip
sudo mv terraform /usr/local/bin/
terraform version

# terraform apply
echo "exec terraform apply..."
cd ~/project_app_microservice/terraform 
terraform init 
terraform apply -auto-approve


# Install kubectl
sudo snap install kubectl --classic

#update kubeconfig pour EKS

aws eks --region eu-west-3 update-kubeconfig --name dev-eksdemo

sleep 20

#Test connextion
echo "connexion ok..."
kubectl get nodes

echo "ok!"

