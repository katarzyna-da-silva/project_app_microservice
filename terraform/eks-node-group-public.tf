# adding three nodes in the cluster
# in the aws_eks_node_group resource, 
# create: node name, add the created roles,  and vpc 

resource "aws_eks_node_group" "eks_ng_public" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${local.name}-eks-ng-public"
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids      = module.vpc.public_subnets 

  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-AmazonEC2ContainerRegistryReadOnly,
  ]

tags = {
  Name = "Public-Node-Group"
}
}


# 2 : 
resource "aws_eks_node_group" "eks_ng_public_2" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${local.name}-eks-ng-public-2" 
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn

  subnet_ids      = module.vpc.public_subnets

  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-AmazonEC2ContainerRegistryReadOnly,
  ]

  tags = {
    Name = "Public-Node-Group-2"
  }
}


# 3 node : 
resource "aws_eks_node_group" "eks_ng_public_3" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${local.name}-eks-ng-public-3" 
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn

  subnet_ids      = module.vpc.public_subnets

  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-AmazonEC2ContainerRegistryReadOnly,
  ]

  tags = {
    Name = "Public-Node-Group-3"
  }
}
