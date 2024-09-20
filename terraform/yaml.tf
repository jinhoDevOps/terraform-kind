# terraform/yaml.tf

resource "kubectl_manifest" "ingress_nginx_controller" {
  yaml_body = file("${path.module}/yaml/ingress-nginx.yaml")

  depends_on = [kind_cluster.default]
}

# Ingress NGINX Controller 준비 상태 대기
resource "null_resource" "wait_for_ingress_nginx" {
  provisioner "local-exec" {
    command = "kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=90s --kubeconfig=${path.module}/kubeconfig"
  }

  depends_on = [kubectl_manifest.ingress_nginx_controller]
}
