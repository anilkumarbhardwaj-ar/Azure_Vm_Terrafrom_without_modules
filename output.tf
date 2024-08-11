
output "public_ip_addresses" {
  value = {
    for ip, details in azurerm_public_ip.pipblock : ip => details.ip_address
  }
}

# Output the subnet IDs
output "subnet_ids" {
  value = { for s in azurerm_subnet.subnet_block : s.name => s.id }
}
# Output the public ip addres id
output "public_ip_ids" {
  value = {
    for ip, details in azurerm_public_ip.pipblock : ip => details.id
  }
}

# Output the public win vm

output "network_interface_ids" {
  value = {
    for nic, details in azurerm_network_interface.nic_block : nic => details.id
  }
}
