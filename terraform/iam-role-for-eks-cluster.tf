# create Role for CLUSTER and policy   adding permissions for the cluster to function
resource "aws_iam_role" "eks_master_role" {
  name = "${local.name}-eks-master-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

# policies for managing the EKS cluster
resource "aws_iam_role_policy_attachment" "eks-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_master_role.name
}
# network ressource management, creation policy for security groups, routes, etc.
resource "aws_iam_role_policy_attachment" "eks-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks_master_role.name
}
# access to ECR (Elastic Container Registry)for service docker
resource "aws_iam_policy_attachment" "eks_node_policy_attachment" {
  name       = "eks-node-policy-attachment"
  roles      = [aws_iam_role.eks_master_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

