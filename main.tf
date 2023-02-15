provider "aws" {
region= "ap-south-1"
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
