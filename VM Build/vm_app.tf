terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "<=3.112.0"
    }


  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

module "vm_app" {
  source   = "./modules/vm"
  for_each = var.vm_app

  vm_name            = each.value["vm_name"]
  vm_size            = each.value["vm_size"]
  rg_name            = each.value["rg_name"]
  location           = each.value["location"]
  tags               = each.value["tags"]
  os_version         = each.value["os_version"]
  vnet_name          = each.value["vnet_name"]
  vnet_rg            = each.value["vnet_rg"]
  subnet_name        = each.value["subnet_name"]
  os_disk_size       = each.value["os_disk_size"]
  os_disk_type       = each.value["os_disk_type"]
  kv_name            = each.value["kv_name"]
  kv_rg              = each.value["kv_rg"]
  username_kv_secret = each.value["username_kv_secret"]
  password_kv_secret = each.value["password_kv_secret"]
  #username    = each.value["username"]
  #password    = each.value["password"]
  data_disks        = each.value["data_disks"]
  data_disk_caching = each.value["data_disk_caching"]
  data_disk_type    = each.value["data_disk_type"]
 

}





/*module "disk_app" {
  source     = "./modules/disk"
  for_each = var.disk_app
  
  vm_name    = each.value["vm_name"]
  location   = each.value["location"]
  rg_name    = each.value["rg_name"]
  disk_type =   each.value["disk_type"]
  disk_size =      each.value["disk_size"]
vm_id = module
  

}*/

