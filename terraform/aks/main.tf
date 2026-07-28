resource "azurerm_resource_group" "k8s" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.k8s.location
  resource_group_name = azurerm_resource_group.k8s.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v3" # Cost-effective burstable VM tier perfect for Dev/Test
  }

  identity {
    type = "SystemAssigned" # Automatically creates a managed identity for the cluster control plane
  }

  tags = {
    Environment = "DevSecOps-Learning"
  }
}
