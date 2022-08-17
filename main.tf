#Stack for creation VPN, Subnets, SecurityGroups, RouteTable and one linux Instance

resource "random_id" "random_id_prefix" {
  byte_length = 2
}

locals {
  production_availability_zones = ["${var.region}a", "${var.region}b", "${var.region}c"]
}

module "Networking" {
  source               = "./modules/Networking"
  region               = var.region
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  availability_zones   = local.production_availability_zones

}

resource "aws_instance" "app_server" {
  ami           = "ami-0c956e207f9d113d5"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-08fe9e27d62e386c7"]
  subnet_id              = "subnet-0725f76b64ae5e26c"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
