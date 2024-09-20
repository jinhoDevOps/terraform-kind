# # terraform/example_app.tf

# resource "kubectl_manifest" "example_app" {
#   yaml_body = file("${path.module}/yaml/example-app.yaml")

#   depends_on = [kind_cluster.default]
# }
