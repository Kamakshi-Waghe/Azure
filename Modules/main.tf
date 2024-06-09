terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

locals {
  currenttime = timestamp()
}

resource "azurerm_resource_group" "RG" {
  name     = var.ResoureceGroup
  location = var.RGLocation

  tags = {

    Deparment    = "IT Department"
    CreationDate = local.currenttime
  }
}

resource "azurerm_virtual_network" "Vnet" {
  name                = "pvt-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

}

resource "azurerm_subnet" "subnet" {
  name                 = "web"
  resource_group_name  = azurerm_resource_group.RG.name
  virtual_network_name = azurerm_virtual_network.Vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "NIC" {

for_each = var.vm-details
  name                = "${each.value.vmname}-nic"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  ip_configuration {
    name                          = "Internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }

}

resource "azurerm_windows_virtual_machine" "VM" {
  #name                = var.VM_Name
for_each = var.vm-details
  name                = each.value.vmname
  resource_group_name = azurerm_resource_group.RG.name
  location            = azurerm_resource_group.RG.location
  size                = each.value.size
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_id = var.VM_Image_ID

  network_interface_ids = ["${azurerm_network_interface.NIC[each.key].id}"]



}

output "VMIP" {
  value = azurerm_windows_virtual_machine.VM.private_ip_address
}
