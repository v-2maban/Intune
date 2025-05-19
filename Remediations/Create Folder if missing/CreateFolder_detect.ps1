<#
Version: 1.0
Author: 
- Manish Bangia (manishbangia.com)
Script: CreateFolder_Detect.ps1
Description: Create the folder if missing
#> 

$RemediationName="*Rem: Create Folder*"
$FolderPath="C:\TestFolder"

Try {
    
    If(Test-path $folderPath) {
            Write-Host "$RemediationName is Compliant, folder already exists"
            Exit 0
            }

    else    {
            Write-Host "$RemediationName is Non-Compliant, Remedition required"
            exit 1
            }
    }

Catch {
            Write-Host "$RemediationName is Non-Compliant, Remedition required"
        Exit 1
      }