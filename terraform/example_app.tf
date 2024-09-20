# terraform/example_app.tf

resource "kubectl_manifest" "example_app" {
  yaml_body = file("${path.module}/yaml/example-app.yaml")

  depends_on = [null_resource.wait_for_ingress_nginx]
}
