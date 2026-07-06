# 1. The Provider Block: Tells Terraform which API engine to load
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

# 2. The Resource Block: Defines the infrastructure component we want to build
# Syntax: resource "resource_type" "resource_custom_name"
resource "local_file" "security_alert" {
  filename = "${path.module}/alert_log.txt"
  content  = "SECURITY ALERT: Local sandboxing verified. Preparing infrastructure blueprints for Module 7 deployment."
}
