variable "region" {
  default = "eu-central-1"
}

variable "environment" {
  description = "Deployment Environment"
}

variable "vpc_cidr" {
  description = "CIDR block of the vpc"
  default = "11.0.0.0/16"
}

variable "public_subnets_cidr" {
  type        = list(any)
  description = "CIDR block for Public Subnet"
  default     = ["11.0.1.0/24"]
}

variable "private_subnets_cidr" {
  type        = list(any)
  description = "CIDR block for Private Subnet"
  default     = ["11.0.10.0/24"]
}


variable "availability_zones" {
  type        = list
  description = "AZ in which all the resources will be deployed"
}
