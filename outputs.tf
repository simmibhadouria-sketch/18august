output "resource_group_name" {
  value       = module.resource_group.resource_group_name
  description = "Created Azure Resource Group Name"
}

output "vnet_name" {
  value       = module.networking.vnet_name
  description = "Created Virtual Network Name"
}

output "vm_private_ips" {
  value       = module.virtual_machines.vm_private_ips
  description = "Private IP addresses assigned to the VMs"
}

output "nat_gateway_public_ip" {
  value       = module.nat_gateway.public_ip_address
  description = "Public IP address of the NAT Gateway"
}

output "bastion_public_ip" {
  value       = module.bastion.public_ip_address
  description = "Public IP address of the Azure Bastion Host"
}

output "bastion_dns_name" {
  value       = module.bastion.bastion_dns_name
  description = "FQDN of the Azure Bastion Host"
}
