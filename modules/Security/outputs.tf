output "sg-eks-cluster" {
  description = "description"
  value       = aws_security_group.eks-cluster.id
}
