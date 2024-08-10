<#$info = gwmi -class win32_computerSystem  -ea silentlycontinue | Select-Object username

if ($info.username.Length -gt 0)

{$Message = $info.username}
else
{ $Message = "No user is logged in locally"}

$message#>

# Get a list of user sessions
$UserInFullOS=$false
$Usersession = Get-CimInstance -ClassName Win32_ComputerSystem
$UserName = $Usersession.UserName


# Check if there are any user sessions
if ($UserName -and $UserName -notmatch "defaultuser" ) {
#if ($UserNames) {
        Write-Output "UserLoggedIn"
        
} else {
        Write-Output "NoUserLoggedIn"
        
}
