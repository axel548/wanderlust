resource "aws_iam_group" "my_group" {
  name = var.group_eks
}

resource "aws_iam_user" "my_user" {
  name = var.user_eks
}

resource "aws_iam_user_group_membership" "my_user_membership" {
  user   = aws_iam_user.my_user.name
  groups = [aws_iam_group.my_group.name]
}

resource "aws_iam_policy" "eks_permissions" {
  name        = "eks_permissions"
  description = "Permissions to manage EKS and ConfigMap"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "eks:DescribeCluster",
          "eks:ListClusters",
          "eks:UpdateKubeconfig",
          "eks:ListNodegroups",
          "eks:DescribeNodegroup",
          "eks:DescribeUpdate",
          "eks:CreateCluster",
          "eks:CreateNodegroup",
          "eks:UpdateNodegroupConfig",
          "eks:UpdateNodegroupVersion",
          "eks:DeleteCluster",
          "eks:DeleteNodegroup",
          "eks:TagResource",
          "eks:UntagResource",
          "eks:DescribeFargateProfile",
          "eks:UpdateFargateProfile",
          "eks:DeleteFargateProfile"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "iam:ListRoles",
          "iam:GetRole"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "eks:AccessKubernetesApi"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret",
          "secretsmanager:ListSecrets"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_group_policy_attachment" "eks_permissions_attachment" {
  group      = aws_iam_group.my_group.name
  policy_arn = aws_iam_policy.eks_permissions.arn
}