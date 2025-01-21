variable "region" {
  description = "Región de AWS"
  default     = "us-east-1"
}

variable "cluster_name" {
  type    = string
  default = "eksWanderlust"
}

variable "cluster_role_name" {
  type    = string
  default = "eksClusterRole"
}

variable "environment" {
  type    = string
  default = "pre-production"
}

variable "user_eks" {
  type    = string
  default = "admin_eks"
}

variable "group_eks" {
  type    = string
  default = "gp-eksWanderlust"
}