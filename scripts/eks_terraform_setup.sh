#!/bin/bash

# Install kubectl
echo "Install..."
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client

# unzip
sudo apt-get update
sudo apt-get install -y unzip

# Install kubectl
sudo snap install kubectl --classic

#update kubeconfig pour EKS

aws eks --region eu-west-3 update-kubeconfig --name dev-eksdemo

sleep 20

#Test connextion
echo "connexion ok..."
kubectl get nodes

echo "ok!"

