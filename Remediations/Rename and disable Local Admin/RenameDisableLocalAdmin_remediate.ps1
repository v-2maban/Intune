<#
Version: 1.0
Author: 
- Manish Bangia (manishbangia.com)
Script: RenameDisableLocalAdmin_remediate.ps1
Description: Rename and Disable Local Admin Account
#>

$NewAdminUser = "LocalAdmin"

$ExistingAdminUser = Get-LocalUser | where-object {$_.SID -like "S-1-5-*-500"}
$ExistingAdminName = $ExistingAdminUser.Name
$ExistingAdminEnabled = $ExistingAdminUser.Enabled


#Rename Local Administrator Account
If($ExistingAdminName -ne $NewAdminUser) {
Write-Output "Renaming Local Administrator account"
Rename-LocalUser -Name $ExistingAdminName -NewName $NewAdminUser
}

#Disable Local Administrator Account
If($ExistingAdminEnabled -eq $true) {
Write-Output "Disabling Local Administrator account"
Disable-LocalUser -Name $NewAdminUser
}