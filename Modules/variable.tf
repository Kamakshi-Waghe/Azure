variable "ResoureceGroup" {
  type        = string
  description = "Resourece Group Name"

}

variable "RGLocation" {
  description = "Location of RG"

}

/*variable "VM_Name" {
    description = "Name of Virtual Machin"
  
}*/

/*variable "VM_Size" {
  description = "Size of the VM"

}*/

variable "VM_Image_ID" {
  description = "Source iamge id"

}

/*variable "vm-details" {
  type = map(object({
    vmname = string
    size = string
  }))

  default = {
    "VM1" = {
      vmanme = "server1"
      size =  "Standard_DS1_v2"
      
    }

    "VM2" = {
      vmanme = "server2"
      size =  "Standard_DS1_v2"
      
    }

    "VM3" = {
      vmanme = "server3"
      size =  "Standard_DS2_v2"
      
    }
  }
  
}*/

variable "vm-details" {
  type = map(object({
    vmname = string
    size   = string
  }))
  default = {
    "VM1" = {
      vmname = "server1"
      size   = "Standard_DS1_v2"
    }
    "VM2" = {
      vmname = "server2"
      size   = "Standard_DS1_v2"
    }
    "VM3" = {
      vmname = "server3"
      size   = "Standard_DS2_v2"
    }
  }
}




