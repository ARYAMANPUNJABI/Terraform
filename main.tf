provider "aws" {
region= "ap-south-1"
TF_VAR var.TF_VAR_AWS_ACCESS_KEY_ID
TF_VAR var.TF_VAR_AWS_SECRET_ACCESS_KEY
}
 module "web" {
    source= "./modules/webmodule/"
    subnetid=module.vpc.websubnet_id
    vpcid=module.vpc.vpc_id
}

module "app" {
    source= "./modules/appmodule/"
}

module "db" {
    source= "./modules/dbmodule/"
}

module "vpc" {
    source= "./modules/vpcmodule/"
    
}
