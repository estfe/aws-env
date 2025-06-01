module "iam" {
  source = "./modules/iam"

  git_user = var.git_user
}

module "vpc" {
  source = "./modules/vpc"
}

module "eks" {
  source     = "./modules/eks"
  depends_on = [module.vpc]

  # Passing outputs from vpc module
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  
  cluster_name = var.cluster_name
}

module "hello" {
  source = "./modules/repository"

  repo_name = var.repo_name
}

module "infra-helm" {
  source     = "./modules/infra-helm"
}

module "auth" {
  source = "./modules/auth"

  git_user_arn = var.git_user_arn
  git_user = var.git_user
}

module "traefik_sg" {
  source = "./modules/security-group"

  vpc_id     = module.vpc.vpc_id
}
