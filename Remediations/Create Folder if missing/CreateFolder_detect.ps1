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
            Write-Output "Compliant: Folder Path Exists"
            Exit 0
            }

    else    {
            Write-Output "Non-Compliant: Path does not exist, Remediation Required for $RemediationName"
            exit 1
            }
    }

Catch {
            Write-Output "Non-Compliant: Path does not exist, Remediation Required for $RemediationName"
        Exit 1
      }
