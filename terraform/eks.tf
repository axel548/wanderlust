module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.31"

  vpc_id                          = module.vpc.vpc_id
  subnet_ids                      = module.vpc.private_subnets
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }


  eks_managed_node_groups = {
    node-group = {
      desired_capacity = 1
      max_capacity     = 2
      min_capacity     = 1
      instance_types   = ["t3.medium"]

    }
  }


  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}


resource "aws_eks_access_entry" "eks_access" {
  cluster_name  = module.eks.cluster_name
  principal_arn = aws_iam_user.my_user.arn
  # kubernetes_groups = ["group-1", "group-2"]
  type = "STANDARD"
}


resource "aws_eks_access_policy_association" "eks_policy_associate" {
  cluster_name  = module.eks.cluster_name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSAdminPolicy"
  principal_arn = aws_iam_user.my_user.arn

  access_scope {
    type = "cluster"
  }
}


