# terraform/kubernetes.tf

resource "kind_cluster" "default" {
  name       = var.cluster_name
  node_image = "kindest/node:v1.27.3"
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
      role = "worker"
      name  = "worker-node-1"
    }
        node {
      role = "worker"
      name  = "worker-node-2"
    }
  }
}
resource "null_resource" "set_kubeconfig" {
  provisioner "local-exec" {
    command = "kind get kubeconfig --name=${var.cluster_name} > kubeconfig"
  }

  depends_on = [kind_cluster.default]
}