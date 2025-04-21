<#
Version: 1.0
Author: 
- Manish Bangia (manishbangia.com)
Script: MultipleRegistryKeys_Remediate.ps1
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


Try {
#Remediate Registry Path (Creates the Registry key if it doesn't exists")
If ((Test-Path -LiteralPath $CheckPath1) -eq $true) {
Write-Output "Registry key already exists for $CheckPath1"
}

Else {
Write-Output "Registry key does not exists for $CheckPath1, creating.."
New-Item $CheckPath1 -Force -ErrorAction SilentlyContinue | Out-Null
Write-Output "Registry key created for $CheckPath1"
}

#Remediate $CheckItem1
If ((Get-ItemProperty -Path $CheckPath1).$CheckItem1 -eq $checkItemProperty1) {
Write-Host "Correct value already exists for $CheckItem1"
}

Else {
Write-Host "Correct value not set for $checkItem1, setting now.."
New-ItemProperty -LiteralPath $CheckPath1 -Name $CheckItem1 -Value $checkItemProperty1 -PropertyType $CheckPropertyType1 -Force | Out-Null
}

#Remediate $CheckItem1
If ((Get-ItemProperty -Path $CheckPath1).$CheckItem2 -eq $checkItemProperty2) {
Write-Host "Correct value already exists for $CheckItem2"
}

Else {
Write-Host "Correct value not set for $CheckItem2, setting now.."
New-ItemProperty -LiteralPath $CheckPath1 -Name $CheckItem2 -Value $checkItemProperty2 -PropertyType $CheckPropertyType2 -Force | Out-Null
}

}

Catch {
Write-Host "Remediation $RemediationName failed"
}

