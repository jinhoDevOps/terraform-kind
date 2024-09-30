# terraform/variables.tf

variable "cluster_name" {
  description = "CKA test Kind cluster"
  type        = string
  default     = "my-kind-cluster"
}