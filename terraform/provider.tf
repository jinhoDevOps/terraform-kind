# terraform/provider.tf


terraform {
  required_providers {
    kind = {
      # https://registry.terraform.io/providers/tehcyx/kind/latest
      source  = "tehcyx/kind"
      version = "0.6.0"
    }
    kubectl = {
      # https://registry.terraform.io/providers/gavinbunney/kubectl/latest
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
    # helm = {
    #  # https://registry.terraform.io/providers/hashicorp/helm/latest
    #   source  = "hashicorp/helm"
    #   version = ">= 2.0.0"
    # }
  }

#   required_version = ">= 1.3.0"
}

# Kind 프로바이더 설정
provider "kind" {
  # 기본 설정을 사용하거나 필요에 따라 추가 구성
}

# Kubectl 프로바이더 설정
provider "kubectl" {
  alias       = "default"
  config_path = "${path.module}/kubeconfig"
}

# # Helm 프로바이더 설정
# provider "helm" {
#   kubernetes {
#     config_path = "${path.module}/kubeconfig"
#   }
# }
