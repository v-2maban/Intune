<#
Version: 1.0
Author: 
- Manish Bangia (manishbangia.com)
Script: UninstallSCCM_Detect.ps1
Description: Detect SCCM Client Agent Script
#>

#Define SCCM Client Agent service Variable
$SCCMClientAgent = "ccmexec"

#Check for SCCM Client Agent service
Try {
If(Get-Service -Name $SCCMClientAgent -ErrorAction stop) {
Write-Output "Non-Compliant: SCCM Client agent detected, remediation required"
exit 1
}

else {
Write-Output "Compliant: SCCM Client agent not detected"
exit 0
}
}


Catch {
Write-Output "Compliant: SCCM Client agent not detected"
exit 0
}