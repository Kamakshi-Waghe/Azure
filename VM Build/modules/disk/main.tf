
/*resource "azurerm_managed_disk" "data_disks" {
  for_each = var.disk_config

  name                 = "${var.vm_name}-data-${each.key}"
  location             = each.value["location"]
  resource_group_name  = each.value["rg_name"]
  storage_account_type = each.value["disk_type"]
  create_option        = "Empty"
  disk_size_gb         = each.value["disk_size"]
}*/



resource "azurerm_managed_disk" "data_disks" {
  name = "${var.vm_name}-data-disk"
  #name                 = "acctestmd"
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = var.disk_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size
}

/*resource "azurerm_virtual_machine_data_disk_attachment" "disk_attachment" {

  managed_disk_id    = azurerm_managed_disk.data_disks.id
  virtual_machine_id = var.vm_id
  caching            = var.host_caching
  depends_on         = [azurerm_managed_disk.data_disks]
}*/

/*resource "azurerm_virtual_machine_data_disk_attachment" "example" {
  count              = length(var.data_disks)
  managed_disk_id    = azurerm_managed_disk.data_disks[count.index].id
  virtual_machine_id = var.vm_id
  lun                = var.lun_ids[count.index]
  caching            = "ReadWrite"
  depends_on = [ azurerm_managed_disk.data_disks ]
}*/