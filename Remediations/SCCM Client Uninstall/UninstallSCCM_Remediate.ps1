<#
Version: 1.0
Author: 
- Manish Bangia (manishbangia.com)
Script: UninstallSCCM_Remediate.ps1
Description: Detect SCCM Client Agent Script
#>

#Define the path to ccmsetup.exe
$ccmsetupPath = "${env:windir}\ccmsetup\ccmsetup.exe"
$SCCMClientService = "ccmexec"


Try {
If(Get-Service -Name $SCCMClientService -ErrorAction stop) {
Write-Output "Remediation Started: SCCM Client Uninstall"
Start-Process -FilePath $ccmsetupPath -ArgumentList "/uninstall" -Wait -NoNewWindow
Write-Output "Remediation Completed: SCCM Client Uninstall"
    }

else {
Write-Output "Remediation not required: SCCM Client agent not found"
     }
}


Catch {
Write-Output "Remediation not required: SCCM Client agent not found"
      }