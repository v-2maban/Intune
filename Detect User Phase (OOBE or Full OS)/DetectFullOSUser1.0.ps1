<#
Version: 2.4
Author: Manish Bangia
Script: DetectOOBEUserInfo
Description:
Release notes: Output can be one of the following:OOBE,Not-OOBE-UserLoggedIn,Not-OOBE-UserNotLoggedIn
How to user the variables:
--------------------------
OOBE : If you want to run the application only in OOBE Phase.
NotOOBE : Application can be installed once Device ESP phase is completed. Application can install even without logging on to the device.
NotOOBE-UserLoggedIn : When you want to install app when user logs in.
Not-OOBE-UserNotLoggedIn : Application will be made available in both phases ie. login page and when user logs in.

#> 


################Start of Function
Function GetOOBEUserInfo() {
$explorerprocesses = @(Get-WmiObject -Query "Select * FROM Win32_Process WHERE Name='explorer.exe'" -ErrorAction SilentlyContinue)
ForEach ($explorerprocess in $explorerprocesses)
    {
        $Username = $explorerprocess.GetOwner().User
        }

#If user has logged in
If ($explorerprocesses.Count -ge 1 -and $Username -notmatch "Defaultuser")
{
    Write-Output "NotOOBE-UserLoggedIn"
    
}

ElseIf($Username -notmatch "Defaultuser") {
Write-Output "NotOOBE"
}


}

#######################################
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
elseif($process -ne $null){

#If user has logged in
If ($explorerprocesses.Count -ge 1 -and $Username -notmatch "Defaultuser")
{
    Write-Output "NotOOBE-UserLoggedIn"
    
}
  
  
}