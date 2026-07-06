# 1. The Provider Config (Keeps the local engine loaded)
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

# 2. The Variable Block: Defines an input slot we can change anytime
variable "alert_message" {
  type        = string
  description = "The security warning payload written to the log file"
  default     = "CRITICAL: Automated compliance scanning active. Securing sandbox perimeter."
}

# 3. The Resource Block: Notice we replaced the hardcoded text with var.alert_message
resource "local_file" "security_alert" {
  filename = "${path.module}/alert_log.txt"
  content  = var.alert_message
}

# 4. The Output Block: Prints information to your screen after running apply
output "file_creation_status" {
  value       = "Success! Security log generated at ${local_file.security_alert.filename}"
  description = "Confirms the exact path of the deployed file asset"
}
