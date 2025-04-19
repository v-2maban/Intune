$ManufacturerValue = (Get-WmiObject Win32_ComputerSystem).Manufacturer
$ModelValue = (Get-WmiObject Win32_ComputerSystem).Model
$Serialnumber = (Get-WmiObject -Class win32_bios).serialnumber
$SerialnumberNoHyphen = $Serialnumber.Replace("-","")
$LastCharSerialnumber = $Serialnumber.Remove(0,($Serialnumber.Length -7))
$OGHostname=$env:COMPUTERNAME


switch -Regex ($ModelValue) {

## For Microsoft Surface Models ##
"Surface" {
$FirstCharSerialnumber = $Serialnumber.Substring(0,9)
Write-Output "This is a $ModelValue Device"
$NewHostName = "AUSP"+"$LastCharSerialNumber"
}

## For Dell Precision and Dell Latitude Models ##
"Precision|Latitude" {
Write-Output "This is a $ModelValue Device"
$NewHostName = "AULPDL"+"$Serialnumber"
}

## For Microsoft Virtual Machine ##
"Virtual Machine" {
Write-Output "This is a $ModelValue Device"
$FirstCharSerialnumber = $SerialnumberNoHyphen.Substring(0,9)
$NewHostName = "AUVM"+"$FirstCharSerialnumber"
}

                            }

#Rename ComputerName
If ($OGHostname -eq $NewHostName) {
Write-Output "No need to rename $NewHostName"
                                  }

Else {
Write-Output "Rename required from $OGHostname to $NewHostName"
Rename-Computer -NewName $NewHostName -Force
#shutdown.exe /g /t 600 /f /c "Restarting the computer"
Start-Sleep -Seconds 30
     }