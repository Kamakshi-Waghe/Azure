/*vm_name      = "stelo-vm"
vm_size      = "Standard_DS1_v2"
rg_name      = "stelo-rg"
location     = "East US"
os_version   = "2019-Datacenter"
vnet_name    = "VM1-vnet"
vnet_rg      = "KamakshiRG"
subnet_name  = "AGSubnet"
os_disk_size = "128"
os_disk_type = "StandardSSD_LRS"
username     = "krftadmin"
password     = "Krftadmin@123"
/*kv_name = "SPN-KV-dev"
kv_rg = "SPN-KV"
username_kv_secret = "VMPassword"
password_kv_secret = "username"*/

/*data_disks = ["32", "64"]
lun_ids    = ["1", "2"]*/


vm_app = {
  "vm1" = {
    vm_name  = "vm1"
    vm_size  = "Standard_DS1_v2"
    rg_name  = "stelo-rg"
    location = "East US"
    tags = {
      environment = "dev"
      team        = "engineering"
      application = "stelo"
    }
    os_version         = "2019-Datacenter"
    vnet_name          = "VM1-vnet"
    vnet_rg            = "KamakshiRG"
    subnet_name        = "AGSubnet"
    os_disk_size       = "128"
    os_disk_type       = "StandardSSD_LRS"
    kv_name            = "kw-kv"
    kv_rg              = "test-kv"
    username_kv_secret = "username-secret"
    password_kv_secret = "password-secret"
    #username     = "krftadmin"
    #password     = "Krftadmin@123"
    data_disks        = ["32", "64", "128"]
    data_disk_caching = "ReadWrite"
    data_disk_type    = "StandardSSD_LRS"
  }

  "vm2" = {
    vm_name  = "vm2"
    vm_size  = "Standard_DS1_v2"
    rg_name  = "stelo-rg"
    location = "East US"
    tags = {
      environment = "dev"
      team        = "engineering"
      application = "stelo"
    }
    os_version         = "2022-Datacenter"
    vnet_name          = "VM1-vnet"
    vnet_rg            = "KamakshiRG"
    subnet_name        = "AGSubnet"
    os_disk_size       = "128"
    os_disk_type       = "StandardSSD_LRS"
    kv_name            = "kw-kv"
    kv_rg              = "test-kv"
    username_kv_secret = "username-secret"
    password_kv_secret = "password-secret"
    #username     = "krftadmin"
    #password     = "Krftadmin@123"
    data_disks        = ["128", "64"]
    data_disk_caching = "ReadWrite"
    data_disk_type    = "StandardSSD_LRS"
  }


}



/*disk_config = {
  "disk1" = {
    location  = "East US"
    rg_name   = "stelo-rg"
    disk_type = "StandardSSD_LRS"
    disk_size = "128"

  }

}*/

/*disk_app = {
  "disk1" = {
    vm_name = "vm1"
    location  = "East US"
    rg_name   = "stelo-rg"
    disk_type = "StandardSSD_LRS"
    disk_size = "128"

  }

  "disk2" = {
    vm_name = "db1"
    location  = "East US"
    rg_name   = "stelo-rg"
    disk_type = "StandardSSD_LRS"
    disk_size = "128"

  }

}*/


