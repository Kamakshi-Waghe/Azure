vm_app = {  "Web1" = {
    vm_name            = "Web1"
    vm_size            = "Standard_DS1_v2"
    rg_name            = "Deploy_RG"
    location           = "East US"
    tags = {
      environment      = "dev"
      team             = "eng"
      application      = "stelo"
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
    data_disks         = ["32", "64"]
    data_disk_caching  = "ReadWrite"
    data_disk_type     = "StandardSSD_LRS"
  }
  "DB1" = {
    vm_name            = "DB1"
    vm_size            = "Standard_DS1_v2"
    rg_name            = "Stelo_RG"
    location           = "East US"
    tags = {
      environment      = "test"
      team             = "devops"
      application      = "sales"
    }
    os_version         = "2016-Datacenter"
    vnet_name          = "VM1-vnet"
    vnet_rg            = "KamakshiRG"
    subnet_name        = "AGSubnet"
    os_disk_size       = "256"
    os_disk_type       = "StandardSSD_LRS"
    kv_name            = "kw-kv"
    kv_rg              = "test-kv"
    username_kv_secret = "username-secret"
    password_kv_secret = "password-secret"
    data_disks         = ["128"]
    data_disk_caching  = "ReadWrite"
    data_disk_type     = "StandardSSD_LRS"
  }
  "App1" = {
    vm_name            = "App1"
    vm_size            = "Standard_DS1_v2"
    rg_name            = "App_RG"
    location           = "East US"
    tags = {
      environment      = "prod"
      team             = "app"
      application      = "app"
    }
    os_version         = "2016-Datacenter"
    vnet_name          = "VM1-vnet"
    vnet_rg            = "KamakshiRG"
    subnet_name        = "AGSubnet"
    os_disk_size       = "128"
    os_disk_type       = "StandardSSD_LRS"
    kv_name            = "kw-kv"
    kv_rg              = "test-kv"
    username_kv_secret = "username-secret"
    password_kv_secret = "password-secret"
    data_disks         = ["32", "32"]
    data_disk_caching  = "ReadWrite"
    data_disk_type     = "StandardSSD_LRS"
  }
  "Stelo1" = {
    vm_name            = "Stelo1"
    vm_size            = "Standard_DS1_v2"
    rg_name            = "Stelo"
    location           = "East US"
    tags = {
      environment      = "qa"
      team             = "eng"
      application      = "stelo"
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
    data_disks         = ["32", "32", "32"]
    data_disk_caching  = "ReadWrite"
    data_disk_type     = "StandardSSD_LRS"
  }
}
