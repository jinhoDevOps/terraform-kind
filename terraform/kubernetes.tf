# terraform/kubernetes.tf

resource "kind_cluster" "default" {
  name           = "test_kind_cluster"
  wait_for_ready = true

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
      role  = "worker"
      # name  = "worker-node-1"
      image = "kindest/node:v1.27.1"
    }

    node {
      role  = "worker"
      # name  = "worker-node-2"
      image = "kindest/node:v1.27.1"
    }
  }
}
