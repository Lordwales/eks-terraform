variable "vpc_id" {
  type        = string
  description = "the vpc id"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "cluster-name" {
  type        = string
  description = "cluster name"
  default = "terraformEKScluster"
}