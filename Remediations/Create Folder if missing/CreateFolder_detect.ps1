<#
Version: 1.0
Author: 
- Manish Bangia (manishbangia.com)
Script: CreateFolder_Detect.ps1
Description: Create the folder if missing
#> 

$RemediationName="Rem: Create Folder"
$FolderPath="C:\TestFolder"

Try {
    
    If(Test-path $folderPath) {
            Write-Host "Compliant: Folder Path Exists"
            Exit 0
            }

    else    {
            Write-Host "Non-Compliant: Path does not exist, Remediation Required for $RemediationName"
            exit 1
            }
    }

Catch {
            Write-Host "Non-Compliant: Path does not exist, Remediation Required for $RemediationName"
        Exit 1
      }