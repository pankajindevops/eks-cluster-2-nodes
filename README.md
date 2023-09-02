
## The following are created using Terraform -

1. EKS Cluster
2. kubectl server and
3. 2 Nodes

Once EKS Cluster is created then we'll execute 
kubectl commands from kubectl server to access our Nodes

EKS requires the VPC to have 2 Public subnets

The iam_role attaches to the EKS Cluster

Name of the cluster = eks-cluster

eks_node_group has 2 EC2 Instances & kubectl-server
