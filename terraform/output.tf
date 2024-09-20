# terraform/outputs.tf

output "kubeconfig" {
  description = "Kubeconfig for the Kind cluster"
  value       = kind_cluster.default.kubeconfig
}

output "cluster_nodes" {
  description = "Number of nodes in the Kind cluster"
  value       = length(kind_cluster.default.kind_config[0].node)
}
