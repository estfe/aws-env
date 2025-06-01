module "iam" {
  source = "./modules/iam"
}

# Importing since this user was created manually from UI
import {
  to = module.iam.module.tfaccount.aws_iam_user.this[0]
  id = "tfaccount"
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
}

module "infra-helm" {
  source     = "./modules/infra-helm"

  github_pat = var.github_pat
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
