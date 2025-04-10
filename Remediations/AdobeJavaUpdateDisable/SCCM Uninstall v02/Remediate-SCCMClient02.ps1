$ccmsetupPath = "${env:windir}\ccmsetup\ccmsetup.exe"
Write-Output "Remediation for SCCM Client Uninstall started"

#Uninstall SCCM Client Agent
If (Test-Path($ccmsetupPath)) {
Start-Process -FilePath $ccmsetupPath -ArgumentList "/uninstall" -Wait -NoNewWindow
Write-Output "Remediation for SCCM Client Uninstall Completed"
}

Else {
Write-Host "SCCM Client agent not found"
Exit 1
}