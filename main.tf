# 1. Resource Group Module
module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = "${var.prefix}-rg"
  location            = var.location
  tags                = var.tags
}

# 2. Networking Module (VNet + VM Subnet + AzureBastionSubnet)
module "networking" {
  source                        = "./modules/networking"
  vnet_name                     = "${var.prefix}-vnet"
  location                      = module.resource_group.location
  resource_group_name           = module.resource_group.resource_group_name
  vnet_address_space            = var.vnet_address_space
  vm_subnet_name                = "${var.prefix}-vm-subnet"
  vm_subnet_address_prefix      = var.vm_subnet_address_prefix
  bastion_subnet_address_prefix = var.bastion_subnet_address_prefix
  tags                          = var.tags
}

# 3. NAT Gateway Module (Standard Public IP + NAT Gateway associated with VM Subnet)
module "nat_gateway" {
  source              = "./modules/nat_gateway"
  nat_gateway_name    = "${var.prefix}-nat-gw"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.resource_group_name
  vm_subnet_id        = module.networking.vm_subnet_id
  tags                = var.tags
}

# 4. Virtual Machine Module (2 Linux VMs with Private IPs only)
module "virtual_machines" {
  source              = "./modules/virtual_machine"
  vm_count            = var.vm_count
  vm_name_prefix      = "${var.prefix}-vm"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.resource_group_name
  subnet_id           = module.networking.vm_subnet_id
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  tags                = var.tags
}

# 5. Azure Bastion Module (Public IP + Azure Bastion Host)
module "bastion" {
  source              = "./modules/bastion"
  bastion_name        = "${var.prefix}-bastion"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.resource_group_name
  bastion_subnet_id   = module.networking.bastion_subnet_id
  tags                = var.tags
}
