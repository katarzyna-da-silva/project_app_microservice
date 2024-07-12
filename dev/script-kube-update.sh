#!/bin/bash
if [ ! -f ~/.kube/config]; then
	echo "kubeconfig does not exist.Installing kubectl"
	curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl
            chmod +x ./kubectl
            sudo mv ./kubectl /usr/local/bin/kubectl
            kubectl version --short --client
else
	echo "Kubeconfig already exists"
fi

aws eks --region eu-west-3 update-kubeconfig --name dev-eksdemo

cat ~/.kube/config
