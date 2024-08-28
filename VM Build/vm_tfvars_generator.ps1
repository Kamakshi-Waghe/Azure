# Import the Excel module
Import-Module ImportExcel

# Path to the Excel file
$excelPath = "C:\Terraform\VM Build Automation\Input Data\VM_Details.xlsx"

# Load the Excel file
$excelData = Import-Excel -Path $excelPath

# Prepare the output .tfvars file path
$tfvarsPath = "C:\Terraform\VM Build\terraform.tfvars"

# Initialize a string to hold the Terraform tfvars content
$tfvarsContent = @"
vm_app = {
"@

# Loop through each row in the Excel data and construct the tfvars format
foreach ($row in $excelData) {
    $vmName = $row.vm_name
    $tfvarsContent += @"
  `"$vmName`" = {
    vm_name            = `"$($row.vm_name)`"
    vm_size            = `"$($row.vm_size)`"
    rg_name            = `"$($row.rg_name)`"
    location           = `"$($row.location)`"
    tags = {
      environment      = `"$($row.environment)`"
      team             = `"$($row.team)`"
      application      = `"$($row.application)`"
    }
    os_version         = `"$($row.os_version)`"
    vnet_name          = `"$($row.vnet_name)`"
    vnet_rg            = `"$($row.vnet_rg)`"
    subnet_name        = `"$($row.subnet_name)`"
    os_disk_size       = `"$($row.os_disk_size)`"
    os_disk_type       = `"$($row.os_disk_type)`"
    kv_name            = `"$($row.kv_name)`"
    kv_rg              = `"$($row.kv_rg)`"
    username_kv_secret = `"$($row.username_kv_secret)`"
    password_kv_secret = `"$($row.password_kv_secret)`"
    data_disks         = ["$(($row.data_disks -split ',') -join '", "')"]
    data_disk_caching  = `"$($row.data_disk_caching)`"
    data_disk_type     = `"$($row.data_disk_type)`"
  }

"@
}

# Close the vm_app block
$tfvarsContent += @"
}
"@

# Write the content to the .tfvars file
Set-Content -Path $tfvarsPath -Value $tfvarsContent

Write-Host "Terraform .tfvars file has been generated at $tfvarsPath"
