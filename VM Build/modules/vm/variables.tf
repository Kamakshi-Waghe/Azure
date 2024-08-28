

variable "vm_name" {
  type        = string
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

variable "tags" {
  type = map(string)
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

variable "kv_name" {
  type = string
}

variable "kv_rg" {
  type = string
}


variable "username_kv_secret" {
  type = string
}


variable "password_kv_secret" {
  type = string
}

/*variable "username" {
  type = string
}

variable "password" {
  type = string
}*/

variable "data_disks" {
  type = list(string)

}

variable "data_disk_caching" {
  type = string
}

variable "data_disk_type" {
  type = string
}

















