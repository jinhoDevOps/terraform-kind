# terraform/kubernetes.tf
locals {
  k8s_config_path = pathexpand("./kind-cluster-config/kubeconfig")  # 사용자 환경에 맞게 설정
}

resource "kind_cluster" "default" {
  name       = var.cluster_name
  node_image = "kindest/node:v1.27.3"
  wait_for_ready = true
  kubeconfig_path = local.k8s_config_path

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"

      kubeadm_config_patches = [
        "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    node-labels: \"ingress-ready=true\"\n"
      ]

      extra_port_mappings {
        container_port = 80
        host_port      = 80
        protocol       = "TCP"
      }

      extra_port_mappings {
        container_port = 443
        host_port      = 443
        protocol       = "TCP"
      }
    }

    node {
      role = "worker"

    }
    node {
      role = "worker"

    }
  }
}

resource "null_resource" "set_kubeconfig" {
  provisioner "local-exec" {
    command = "export KUBECONFIG=${local.k8s_config_path}"
  }

  depends_on = [kind_cluster.default]
}