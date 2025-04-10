<#
Version: 1.0
Author: 
- Manish Bangia (manishbangia.com)
#> 

$ErrorActionPreference = "stop"
Try {
    $FolderPath="C:\Mahesh"
    $P=Test-path $folderPath

    If($P) {
            Write-Host "Compliant: Folder Path Exit"
            Exit 0
            }

            else
            {
            Write-Host "Non-Compliant: Path does not exit "
            exit 1
            }
        }

    Catch {
        Write-Host "Path Doesn't Exist, initiating remediation script"
        Exit 1
       }