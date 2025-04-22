<#
Version: 1.0
Author: 
- Manish Bangia (manishbangia.com)
Script: CreateFolder_Remediate.ps1
Description: Create the folder if missing
#>

$RemediationName="Rem: Create Folder"
$FolderPath="C:\TestFolder"

Try {
    
    If(Test-path $folderPath) {
            Write-Host "Compliant: Folder Path Exists"
                              }

    else    {
        Write-Output "Remediating missing folder"
        New-Item -Name "TestFolder" -Path "c:\" -Itemtype Directory | Out-Null
            }
    }

Catch {
            Write-Output "Remediation failed for $RemediationName"
        Exit 1
      }
