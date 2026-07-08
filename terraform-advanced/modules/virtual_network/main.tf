resource "local_file" "network_manifest" {
  filename = "${path.module}/network_topology.json"
  content  = <<EOF
{
  "infrastructure_vnet": "${var.network_name}",
  "security_tier": "${var.subnet_purpose}",
  "firewall_status": "active",
  "default_policy": "DENY_ALL_INBOUND"
}
EOF
}
