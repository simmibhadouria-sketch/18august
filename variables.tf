variable "prefix" {
  type        = string
  description = "Prefix for all Azure resource names"
  default     = "myapp"
}

variable "location" {
  type        = string
  description = "Azure Region for deployment"
  default     = "East US"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for Virtual Network"
  default     = ["10.0.0.0/16"]
}

variable "vm_subnet_address_prefix" {
  type        = list(string)
  description = "Subnet address prefix for VMs"
  default     = ["10.0.1.0/24"]
}

variable "bastion_subnet_address_prefix" {
  type        = list(string)
  description = "Subnet address prefix for Azure Bastion"
  default     = ["10.0.2.0/24"]
}

variable "vm_count" {
  type        = number
  description = "Number of Virtual Machines to deploy"
  default     = 2
}

variable "vm_size" {
  type        = string
  description = "Size SKU for Virtual Machines"
  default     = "Standard_B1s"
}

variable "admin_username" {
  type        = string
  description = "Administrator username for Linux VMs"
  default     = "azureuser"
}

variable "admin_password" {
  type        = string
  description = "Administrator password for Linux VMs (Must meet Azure complexity requirements)"
  sensitive   = true
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to all resources"
  default = {
    Environment = "Practice"
    ManagedBy   = "Terraform"
  }
}
