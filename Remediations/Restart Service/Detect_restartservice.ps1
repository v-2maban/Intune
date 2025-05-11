<#
Version: 1.0
Author: 
- Manish Bangia (manishbangia.com)
Script: Detect_restartservice.ps1
Description: Check if service is running
#> 

$RemediationName="*Rem: Check Service*"
$ErrorActionPreference = "Stop"
$CheckServiceName = "winmgmt"


Try {
$CheckServiceStatus = Get-Service -Name $CheckServiceName


If ($CheckServiceStatus.Status -eq "Running") {
    Write-Output "Remediation Compliant for $RemediationName"
    Exit 0
    }

Else {
    Write-Output "Remediation Non-Compliant for $RemediationName"
    Exit 1
    }
}

Catch {
    Write-Output "Remediation will not run for $RemediationName as $CheckServiceName does not exists"
    Exit 1
    }
