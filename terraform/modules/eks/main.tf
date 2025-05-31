module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.34.0"

  #depends_on = [ module.vpc, module.iam ]

  cluster_name    = "eks-cluster"
  cluster_version = "1.31"

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids # Adding the nodes under the private subnet

  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  cluster_endpoint_public_access           = true
  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    nodegroup = {
      instance_types = ["c3.xlarge"]
      max_size       = 3
      min_size       = 1
      desired_size   = 3
    }
  }

  tags = {
    terraform = true
  }


}
