<#
Version: 1.0
Author: 
- Manish Bangia (manishbangia.com)
Script: Remediate_restartservice.ps1
Description: Check if service is running
#> 

$RemediationName="*Rem: Check Service*"
$ErrorActionPreference = "Stop"
$CheckServiceName = "iphlpsvc"


Try {
$CheckServiceStatus = Get-Service -Name $CheckServiceName


If ($CheckServiceStatus.Status -ne "Running") {
    Write-Output "$RemediationName initiating..."
    Start-Service -Name $CheckServiceName
    }
   }

Catch {
    Write-Output "$RemediationName failed as $CheckServiceName does not exists"
    Exit 1
    }
