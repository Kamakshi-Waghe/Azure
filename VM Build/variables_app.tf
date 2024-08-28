
variable "vm_app" {
  type = map(object({
    vm_name            = string
    vm_size            = string
    rg_name            = string
    location           = string
    tags               = map(string)
    os_version         = string
    vnet_name          = string
    vnet_rg            = string
    subnet_name        = string
    os_disk_size       = string
    os_disk_type       = string
    kv_name            = string
    kv_rg              = string
    username_kv_secret = string
    password_kv_secret = string
    #username     = string
    #password     = string
    data_disks        = list(string)
    data_disk_caching = string
    data_disk_type    = string
  }))

}






/*variable "vm_name" {
  type        = vm_app
  description = "Name of the virtual machine"
}

variable "vm_size" {
  type = string
}

variable "rg_name" {
  type = string

}

variable "location" {
  type = string
}

variable "os_version" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_rg" {
  type = string
}


variable "subnet_name" {
  type = string
}

variable "os_disk_size" {
  type = string
}

variable "os_disk_type" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}


variable "data_disks" {
  type = list(string)
}

variable "lun_ids" {
  type = list(string)
}

/*variable "kv_name" {
  type        = string
}

variable "kv_rg" {
  type        = string
}


variable "username_kv_secret" {
  type        = string
}


variable "password_kv_secret" {
  type        = string
}*/





/*variable "location" {
  type        = string
}

variable "rg_name" {
  type        = string
}

variable "vm_name" {
  type        = string
}

variable "vm_id" {
  type        = string
}*/

























