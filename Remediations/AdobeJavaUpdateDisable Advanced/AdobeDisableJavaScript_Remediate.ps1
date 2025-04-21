<#
Version: 1.0
Author: 
- Manish Bangia (manishbangia.com)
Script: AdobeDisableJavaScript_Remediate.ps1
Description: Remediation Script for Adobe Acrobat Reader FeatureLockDown
#>

$RemediationName="Rem: Adobe Reader"
$ErrorActionPreference = "Stop"
$CheckPath1="HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown"
$CheckItem1="bDisableJavaScript"
$checkItemProperty1=1
$CheckPropertyType1=[Microsoft.Win32.RegistryValueKind]::DWord
$CheckValue1=1;$CheckValue2=1

Try {
#Remediate Registry Path (Check the registry key)
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


}

Catch {
    Write-Host "Remediation $RemediationName failed"
    Exit 1
}