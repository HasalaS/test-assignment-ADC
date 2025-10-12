output "eks_cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "eks_node_group" {
  value = aws_eks_node_group.eks_node_group.node_group_name
}

output "eks_admin_user" {
  value = aws_iam_user.eks_admin_user.name
}
