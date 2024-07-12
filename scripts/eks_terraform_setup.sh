#!/bin/bash

# Install kubectl
echo "Install kubectl"
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# unzip
sudo apt-get update
sudo apt-get install -y unzip

#update kubeconfig pour EKS

kubectl config use-context dev-eksdemo
kubectl config current-context

sleep 10

#Test connextion
echo "connexion ok..."
kubectl get nodes

echo "exec compled!"

