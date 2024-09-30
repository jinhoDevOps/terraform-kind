# Terraform Kind Kubernetes Cluster Setup

This repository provides Terraform code to set up a local Kubernetes cluster using Kind (Kubernetes in Docker). The setup includes the installation of NGINX Ingress Controller and example applications, designed for testing and learning Kubernetes in a local environment (e.g., for CKA preparation).

>**Note**: the NGINX Ingress Controller and example applications are excluded from the Terraform setup due to configuration issues. You can manually deploy these components later if needed.

## Prerequisites

Before running this project, ensure you have the following installed:

- **Terraform** (>= 1.3.0)
- **Docker** (Required for running Kind in containers)

## Setup Guide

### 1. Clone the Repository

```bash
git clone <repository-url>
cd <repository-folder>/terraform
```

### 2. Initialize Terraform

Initialize the project and download the required Terraform providers:

```bash
terraform init
```

### 3. Apply the Terraform Configuration

To apply the Terraform configuration and create the Kubernetes cluster with NGINX Ingress Controller and example applications, run:

```bash
terraform apply
```

Review the plan, then type `yes` to proceed.

### 4. Verify the Cluster Setup

Once Terraform has applied the configuration, verify the cluster and resources:

#### List Nodes

```bash
kubectl get nodes
```

#### Verify NGINX Ingress Controller

```bash
kubectl get pods -n ingress-nginx
```

#### Verify Example Applications

```bash
kubectl get pods
kubectl get services
kubectl get ingress
```

### 5. Test Example Applications

After everything is set up, test the example applications by running:

#### Test Foo Application

```bash
curl localhost/foo/hostname
```

#### Test Bar Application

```bash
curl localhost/bar/hostname
```

If everything is working correctly, you should get responses from `foo-app` and `bar-app`.

---

## Troubleshooting

- Ensure Docker is running on your machine.
- Verify your system meets the prerequisites listed above.
- If using Windows, you may need to adjust file paths for the YAML files or use **WSL** (Windows Subsystem for Linux) for proper compatibility with shell commands.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

## Notes for Windows Users

On Windows systems, certain shell commands and file paths may not work as expected. It is recommended to use **WSL (Windows Subsystem for Linux)** for running this project on Windows. Alternatively, you can adapt the paths to the Windows environment as necessary.
```bash
╷
│ Error: Incompatible provider version
│ 
│ Provider registry.terraform.io/tehcyx/kind v0.6.0 does not have a package available for your current platform, windows_386.
│
│ Provider releases are separate from Terraform CLI releases, so not all providers are available for all platforms. Other versions of this provider may have different platforms supported.
╵
```
### WSL
```bash
wsl -d Ubuntu-22.04
```

---
GPT-4o 가 작성해준 리드미