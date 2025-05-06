<#
Version: 1.0
Author: 
- Manish Bangia (manishbangia.com)
Script: RenameDisableLocalAdmin_detect.ps1
Description: Rename and Disable Local Admin Account
#> 

$NewAdminUser = "LocalAdmin"

$ExistingAdminUser = Get-LocalUser | where-object {$_.SID -like "S-1-5-*-500"}
$ExistingAdminName = $ExistingAdminUser.Name
$ExistingAdminEnabled = $ExistingAdminUser.Enabled


#Check Local Administrator Account Name
If($ExistingAdminName -ne $NewAdminUser) {
Write-Output "Local Admin Account not as per the standards"
Exit 1
}

#Check if Local Administrator Account is enabled
If($ExistingAdminEnabled -eq $true) {
Write-Output "Local Account is Enabled"
Exit 1
}