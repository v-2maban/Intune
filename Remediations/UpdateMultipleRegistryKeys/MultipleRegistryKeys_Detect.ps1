<#
Version: 1.0
Author: 
- Manish Bangia (manishbangia.com)
Script: MultipleRegistryKeys_Detect.ps1
Description: Detection Script Accessibility
#>

$RemediationName="Rem: Autopilot"
$ErrorActionPreference = "Stop"
$CheckPath1="HKLM:\SOFTWARE\Autopilot\SOE"
$CheckItem1="AutopilotStart"
$CheckItem2="AutopilotStop"
$checkItemProperty1=1
$checkItemProperty2=1
$CheckPropertyType1=[Microsoft.Win32.RegistryValueKind]::DWord
$CheckPropertyType2=[Microsoft.Win32.RegistryValueKind]::DWord
$CheckValue1=1;$CheckValue2=1;$CheckValue3=1

Try {
#Detect Registry Path (Check the registry key)
If ((Test-Path -LiteralPath $CheckPath1) -ne $true) {
$CheckValue1=0
Write-Output "Remediation Required for $RemediationName"
exit 1
}


#Detect $CheckItem1
If((Get-ItemProperty -Path $CheckPath1 -Name $CheckItem1).$CheckItem1 -ne 1)
{
$CheckValue2=0
Write-Output "Remediation Required for $RemediationName"
Exit 1
}

#Detect $CheckItem1
If((Get-ItemProperty -Path $CheckPath1 -Name $CheckItem2).$CheckItem2 -ne 1)
{
$CheckValue3=0
Write-Output "Remediation Required for $RemediationName"
Exit 1
}

If($CheckValue1 -eq 1 -and $CheckValue2 -eq 1 -and $CheckValue3 -eq 1) {
Write-Output "Remediation $RemediationName is Compliant"
Exit 0
}

Else {
Write-Output "Remediation required for $RemediationName"
Exit 1
}

}

Catch {
    Write-Host "Remediation required for $RemediationName"
    Exit 1
}