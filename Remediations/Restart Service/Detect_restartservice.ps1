<#
Version: 1.0
Author: 
- Manish Bangia (manishbangia.com)
Script: Detect_restartservice.ps1
Description: Check if service is running
#> 

$RemediationName="*Rem: Check Service*"
$ErrorActionPreference = "Stop"
$CheckServiceName = "iphlpsvc"


Try {
$CheckServiceStatus = Get-Service -Name $CheckServiceName


If ($CheckServiceStatus.Status -eq "Running") {
    Write-Output "$RemediationName is Compliant for $CheckServiceName"
    Exit 0
    }

Else {
    Write-Output "$RemediationName is Non-Compliant for $CheckServiceName"
    Exit 1
    }
}

Catch {
    Write-Output "Remediation will not run for $RemediationName as $CheckServiceName does not exists"
      }
