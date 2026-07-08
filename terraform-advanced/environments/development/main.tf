# Call the reusable network security blueprint template
module "dev_network" {
  source       = "../../modules/virtual_network"
  
  # Inject custom variables for the development team footprint
  network_name   = "dev-vnet-isolated"
  subnet_purpose = "sandboxed-testing"
}
