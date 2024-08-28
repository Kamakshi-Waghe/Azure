resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
  tags     = var.tags
  lifecycle {
    ignore_changes = [tags]
  }
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.vnet_rg
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = var.vnet_rg
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  #depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${azurerm_network_interface.nic.name}-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  #depends_on          = [azurerm_network_interface.nic]
}

resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
  #depends_on                = [azurerm_network_interface.nic, azurerm_network_interface_security_group_association.nic_nsg]
}

data "azurerm_key_vault" "kv_name" {
  name                = var.kv_name
  resource_group_name = var.kv_rg
}

data "azurerm_key_vault_secret" "username_secret" {
  name         = var.username_kv_secret
  key_vault_id = data.azurerm_key_vault.kv_name.id
}

data "azurerm_key_vault_secret" "password_secret" {
  name         = var.password_kv_secret
  key_vault_id = data.azurerm_key_vault.kv_name.id
}

resource "azurerm_virtual_machine" "vm" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = var.vm_size

  storage_os_disk {
    name              = "${var.vm_name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.os_disk_type
    disk_size_gb      = var.os_disk_size
  }

  dynamic "storage_data_disk" {
    for_each = var.data_disks
    content {
      name          = "${var.vm_name}-data-${storage_data_disk.key}"
      lun           = storage_data_disk.key
      caching       = var.data_disk_caching
      create_option = "Empty"
      #managed_disk_id = storage_data_disk.value
      managed_disk_type = var.data_disk_type
      disk_size_gb      = storage_data_disk.value
    }
  }

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = var.os_version
    version   = "latest"
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = data.azurerm_key_vault_secret.username_secret.value
    admin_password = data.azurerm_key_vault_secret.password_secret.value
    #admin_username = var.username
    #admin_password = var.password
  }

  os_profile_windows_config {
    provision_vm_agent = true
    #enable_automatic_upgrades = true
  }

}





