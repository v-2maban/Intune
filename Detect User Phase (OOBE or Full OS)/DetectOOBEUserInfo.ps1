<#
Version: 1.0
Author: Manish Bangia
Script: DetectOOBEUserInfo
Description:
Release notes: Output can be OOBE,NotOOBE-NoUserLoggedIn,NotOOBE-UserLoggedIn,NotOOBE-DefaultUserLoggedIn
#> 


$process = Get-Process -Name SecurityHealthsystray -ErrorAction SilentlyContinue


################Start of Function
Function GetOOBEUserInfo() {
$Usersession = Get-CimInstance -ClassName Win32_ComputerSystem
$UserName = $Usersession.UserName

# Check if there are any user sessions
#If No user has logged in

if ($UserName -eq $null ) {
   Write-Output "NotOOBE-NoUserLoggedIn"
}

#If normal user has logged in but it is not defaultuser
elseif ($UserName -and $UserName -notmatch "defaultuser") {
   Write-Output "NotOOBE-UserLoggedIn"
}

#If Default user has logged in
elseif ($UserName -and $UserName -match "defaultuser") {
   Write-Output "NotOOBE-DefaultUserLoggedIn"
}
     

                                                        
}
##############End of Function


#If process is null, device is in OOBE
if($process -eq $null)
{
  Write-Output "OOBE"
  
}

# If process is not found, we're not in OOBE
elseif($process -ne $null){
  
  #Not in OOBE, run the function GetOOBEUserInfo() now:  
  GetOOBEUserInfo
  
}