Try {
$CheckSCCMClient = Get-Item -Path C:\windows\ccm\CcmExec.exe -ErrorAction Stop

If($CheckSCCMClient) {
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