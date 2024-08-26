<#
Version: 1.0
Author: Manish Bangia
Script: DetectOOBEUserInfo
Description:
Release notes: Output can be one of the following:OOBE,Not-OOBE
How to user the variables:
--------------------------
OOBE : If you want to run the application only in OOBE Phase.
NotOOBE : Application can be installed once Device ESP phase is completed. Application can install even without logging on to the device.
#> 


################################
Main Script
$process = Get-Process -Name SecurityHealthsystray -ErrorAction SilentlyContinue
$explorerprocesses = @(Get-WmiObject -Query "Select * FROM Win32_Process WHERE Name='explorer.exe'" -ErrorAction SilentlyContinue)
ForEach ($explorerprocess in $explorerprocesses)
    {
        $Username = $explorerprocess.GetOwner().User
        }

#If process is null, device is in OOBE
if($process -eq $null)
{
  Write-Output "OOBE"
  
}

# If process is not found, we're not in OOBE
else {
  If($Username -notmatch "Defaultuser") {
  Write-Output "NotOOBE"
}
   
  
}