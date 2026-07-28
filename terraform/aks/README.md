# Azure Kubernetes Service (AKS) & Helm Deployment with Terraform

A declarative Infrastructure-as-Code (IaC) blueprint provisioning a managed Azure Kubernetes Service (AKS) cluster in `eastus` using Terraform, integrated with Helm for automated cloud application deployments.

## 🏗️ Architecture & Stack

- **Cloud Provider:** Microsoft Azure (`azurerm`)
- **Infrastructure as Code:** Terraform
- **Container Orchestration:** Azure Kubernetes Service (AKS)
- **Package Management:** Helm (Bitnami NGINX Release)
- **Node Configuration:** `Standard_D2s_v3` (Linux/Ubuntu)

## 🚀 Quick Start

### Prerequisites
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Terraform](https://www.terraform.io/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Helm](https://helm.sh/)

### 1. Provision Infrastructure
```bash
az login
terraform init
terraform apply -auto-approve
