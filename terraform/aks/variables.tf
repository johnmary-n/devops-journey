variable "resource_group_name" {
  type        = string
  default     = "rg-devops-journey-aks"
  description = "The name of the Resource Group where AKS will live."
}

variable "location" {
  type        = string
  default     = "eastus" # Keeps latency minimal and leverages local region endpoints
  description = "The target Azure data center region."
}

variable "cluster_name" {
  type        = string
  default     = "aks-devsecops-cluster"
  description = "The name of the managed AKS cluster."
}

variable "dns_prefix" {
  type        = string
  default     = "devsecopsjourneyk8s"
  description = "DNS prefix specified when creating the managed cluster."
}
