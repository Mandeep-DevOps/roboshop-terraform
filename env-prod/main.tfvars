env              = "prod"
project_name     = "roboshop"
kms_key_id       = "arn:aws:kms:us-east-1:739561048503:key/20f88998-08b8-4757-b797-48516b57b1ef"
bastion_cidrs    = ["172.31.45.221/32"]
prometheus_cidrs = ["172.31.84.209/32"]
acm_arn          = "arn:aws:acm:us-east-1:739561048503:certificate/cd6d0623-15f3-489a-aae1-badb324eafe7"
zone_id          = "Z09059901XRPHNYMGLMJ4"

vpc = {
  main = {
    vpc_cidr            = "10.20.0.0/21"
    public_subnets_cidr = ["10.20.0.0/25", "10.20.0.128/25"]
    web_subnets_cidr    = ["10.20.1.0/25", "10.20.1.128/25"]
    app_subnets_cidr    = ["10.20.2.0/25", "10.20.2.128/25"]
    db_subnets_cidr     = ["10.20.3.0/25", "10.20.3.128/25"]
    az                  = ["us-east-1a", "us-east-1b"]
  }
}

eks = {
  main = {
    node_groups = {
      n2 = {
        size           = 1
        instance_types = ["m7i.large"]
        capacity_type  = "SPOT"
      }
    }
  }
}

docdb = {
  main = {
    engine                 = "docdb"
    engine_version         = "4.0.0"
    instance_class         = "db.t3.medium"
    parameter_group_family = "docdb4.0"
    instance_count         = 1
  }
}

elasticache = {
  main = {
    engine                 = "redis"
    engine_version         = "6.2"
    node_type              = "cache.t3.micro"
    parameter_group_family = "redis6.x"
    num_cache_nodes        = 1
  }
}

rabbitmq = {
  main = {
    instance_type = "t3.small"
  }
}

rds = {
  main = {
    allocated_storage      = 20
    engine                 = "mysql"
    engine_version         = "5.7.44"
    instance_class         = "db.m5.large"
    parameter_group_family = "mysql5.7"
  }
}

