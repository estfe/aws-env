// Source: https://registry.terraform.io/modules/terraform-aws-modules/iam/aws/latest

module "svc_account" {
  source = "terraform-aws-modules/iam/aws//modules/iam-user"
  name                  = var.git_user
  create_iam_access_key = false
  policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess",
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSNetworkingPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  ]
}
