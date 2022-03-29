variable "region" {
  type        = string
  description = "The region to deploy resources"
}

variable "vpc_cidr" {
  type        = string
  description = "The VPC cidr"
}

variable "enable_dns_support" {
  type = bool
}

variable "enable_dns_hostnames" {
  type = bool
}

variable "enable_classiclink" {
  type = bool
}

variable "enable_classiclink_dns_support" {
  type = bool
}

variable "preferred_number_of_public_subnets" {
  type        = number
  description = "Number of public subnets"
}

variable "preferred_number_of_private_subnets" {
  type        = number
  description = "Number of private subnets"
}


variable "private_subnets" {
  type        = list(any)
  description = "List of private subnets"
  default     = ["10.0.2.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "public_subnets" {
  type        = list(any)
  description = "list of public subnets"
  default     = ["10.0.1.0/24", "10.0.3.0/24"]

}

variable "environment" {
  type        = string
  description = "Enviroment"
}

