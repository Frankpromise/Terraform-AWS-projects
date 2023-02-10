locals {
  vpc_cidr = "10.123.0.0/16"
}

locals {
  security_groups = {
    public = {
      name        = "public-sg"
      description = "security group for public access"
      ingress = {
        ssh = {
          from        = 22
          to          = 22
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        http = {
          from        = 80
          to          = 80
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
        custom_tcp = {
          from        = 5432
          to          = 5432
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
        custom_tcp = {
          from        = 8000
          to          = 8000
          protocol    = "tcp"
          cidr_blocks = [local.vpc_cidr]
        }
      }
    }
    rds = {
      name        = "rds_sg"
      description = "rds_access"
      ingress = {
        postgres = {
          from        = 5432
          to          = 5432
          protocol    = "tcp"
          cidr_blocks = [local.vpc_cidr]
        }
      }
    }
  }
}