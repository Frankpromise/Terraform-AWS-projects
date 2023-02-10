module "compute" {
  source              = "./compute"
  instance_count      = 3
  instance_type       = "t3.micro"
  vol_size            = 10
  public_sg           = module.networking.public_sg
  public_subnets      = module.networking.public_subnets
  key_name            = "my-key"
  public_key_path     = "~/.ssh/my-key.pub"
  user_data_path      = "${path.root}/install.sh"
  lb_target_group_arn = module.loadbalancing.lb_target_group_arn
  tg_port             = 80
}


module "networking" {
  source           = "./Networking"
  vpc_cidr         = local.vpc_cidr
  access_ip        = var.access_ip
  security_groups  = local.security_groups
  public_sn_count  = 3
  private_sn_count = 3
  max_subnets      = 20
  public_cidrs     = [for i in range(2, 255, 2) : cidrsubnet(local.vpc_cidr, 8, i)]
  private_cidrs    = [for i in range(1, 255, 2) : cidrsubnet(local.vpc_cidr, 8, i)]

}

module "loadbalancing" {
  source                 = "./loadbalancing"
  public_sg              = module.networking.public_sg
  public_subnets         = module.networking.public_subnets
  vpc_id                 = module.networking.vpc_id
  bucket = module.storage.bucket
  name = "awslogs"
  tg_port                = 80
  tg_protocol            = "HTTP"
  lb_healthy_threshold   = 2
  lb_unhealthy_threshold = 2
  lb_timeout             = 3
  lb_interval            = 30
  listener_port          = 80
  listener_protocol      = "HTTP"
  depends_on = [
    module.storage.bucket
  ]
}

module "storage" {
  source      = "./storage"
  bucket_name = "mtc-lb-tg-${substr(uuid(), 0, 3)}"
  bucket_policy_name = "aws_s3_bucket.b.id"
}