# Security group for network traffic to and from AWS EKS Cluster.

resource "aws_security_group" "eks-cluster" {
  name        = "SG-eks-cluster"
  vpc_id      = var.vpc_id 

# Egress allows Outbound traffic from the EKS cluster to the  Internet 

  egress {                   # Outbound Rule
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
# Ingress allows Inbound traffic to EKS cluster from the  Internet 

  # ingress {                  # Inbound Rule
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

}

resource "aws_security_group" "worker-node-sg" {
  name        = "worker-nodeSG"
  description = "Security group for all nodes in the cluster"
  vpc_id      = "${var.vpc_id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name"                   = "worker-node-sg"
    "kubernetes.io/cluster/" = "${var.cluster-name}"
  }
}

resource "aws_security_group_rule" "cluster-ingress-node" {
  description              = "Allow pods to communicate with the cluster API Server"
  from_port                = 80
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.eks-cluster.id}"
  source_security_group_id = "${aws_security_group.worker-node-sg.id}"
  to_port                  = 80
  type                     = "ingress"
}