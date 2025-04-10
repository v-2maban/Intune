$SCCMClientService = "ccmexec"

#Check for SCCM Client
Try {
If(Get-Service -Name $SCCMClientService -ErrorAction stop) {
Write-Output "Non-Compliant: Found SCCM Agent"
exit 1
}

else {
Write-Output "Compliant: SCCM Client agent not found"
exit 0
}
}


Catch {
Write-Output "Compliant: SCCM Client agent not found"
exit 0
}