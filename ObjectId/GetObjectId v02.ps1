<#
Version: 1.0
Author: 
- Manish Bangia (manishbangia.com)
Script: GetObjectId v02.ps1
Description: Script to upload bulk members to Entra ID group.
Version 2 utilises Microsoft.Entra group replacing AzureAD group
#>



If (get-installedmodule Microsoft.Entra) 
{Write-Host "Entra Module already installed" -ForegroundColor Cyan }

Else {
Install-Module Microsoft.Entra
}
Connect-Entra
Connect-MgGraph

$Devices=Get-Content .\Computers.txt
$OutputList = @()
$Obj = @()
$Objtemplate="version:v1.0","Member object ID or user principal name [memberObjectIdOrUpn] Required"

foreach ($Device in $Devices) {
    Write-Host "Searching for: $Device" -ForegroundColor Cyan
    $Obj = Get-EntraDevice -SearchString $Device | Where-Object {$_.DeviceTrustType -eq 'AzureAd'} | Select -ExpandProperty ObjectId
    $Outputlist += Get-EntraDevice -ObjectId $Obj | Select DisplayName, ObjectId,DeviceTrustType
    $Objtemplate += Get-EntraDevice -SearchString $Device | Where-Object {$_.DeviceTrustType -eq 'AzureAd'} | Select -ExpandProperty ObjectId
    }

$OutputList | Out-File .\DevicewithDeviceId.csv
$OutputList | Select -ExpandProperty ObjectId | Out-File .\DevicewithDeviceIdonly.csv
#$OutputListAll = Get-AzureADDevice -All $true | Select DisplayName, ObjectId,  DeviceTrustType
#$OutputListAll | Out-File .\AllDeviceswithObjectid.csv
$Objtemplate | Out-File .\CsvTemplateToUpload.csv
