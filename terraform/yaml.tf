# terraform/yaml.tf

# # 클러스터 API 서버가 준비될 때까지 대기
# resource "null_resource" "wait_for_api_server" {
#   provisioner "local-exec" {
#     command = "for i in {1..60}; do kubectl get nodes && break || sleep 10; done"
#   }

#   depends_on = [kind_cluster.default]
# }
# # Ingress NGINX YAML 파일을 읽음
# data "kubectl_file_documents" "nginx_ingress" {
#   content = file("${path.module}/yaml/ingress-nginx.yaml")
# }

# # Ingress NGINX 컨트롤러 배포
# resource "kubectl_manifest" "nginx_ingress" {
#   for_each = data.kubectl_file_documents.nginx_ingress.manifests

#   yaml_body = each.value

#   depends_on = [null_resource.wait_for_api_server]  # 클러스터 준비 후 배포
# }
