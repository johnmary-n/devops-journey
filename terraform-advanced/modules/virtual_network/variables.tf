variable "network_name" {
  type        = string
  description = "The name of the organizational virtual network subnet"
}

variable "subnet_purpose" {
  type        = string
  description = "Tags the network layer purpose (e.g., public, private, dmz)"
  default     = "general-compute"
}
