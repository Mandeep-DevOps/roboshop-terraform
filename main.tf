module "vpc" {
  source   = "git::https://github.com/raghudevopsb77/tf-module-vpc.git"
  for_each = var.vpc

  vpc_cidr     = each.value["vpc_cidr"]
  env          = var.env
  project_name = var.project_name

  public_subnets_cidr = each.value["public_subnets_cidr"]
  web_subnets_cidr    = each.value["web_subnets_cidr"]
  app_subnets_cidr    = each.value["app_subnets_cidr"]
  db_subnets_cidr     = each.value["db_subnets_cidr"]

  az = each.value["az"]

}

module "eks" {
  source   = "git::https://github.com/raghudevopsb77/tf-module-eks.git"
  for_each = var.eks

  env          = var.env
  project_name = var.project_name
  component    = "eks"

  subnet_ids   = lookup(lookup(module.vpc, "main", null), "app_subnets_ids", null)
  node_groups  = each.value["node_groups"]
}

