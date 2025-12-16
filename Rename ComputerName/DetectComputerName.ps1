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
$NewHostName = "AUSP"+"$LastCharSerialNumber"
}

## For Dell Precision and Dell Latitude Models ##
"Precision|Latitude" {
$NewHostName = "AULPDL"+"$Serialnumber"
}

## For HP ZBook Models ##
"ZBook" {
Write-Output "This is a $ModelValue Device"
$NewHostName = "AULTH"+"$Serialnumber"
}

## For Microsoft Virtual Machine ##
"Virtual Machine" {
$FirstCharSerialnumber = $SerialnumberNoHyphen.Substring(0,9)
$NewHostName = "AUVM"+"$FirstCharSerialnumber"
}

                            }

#Detect ComputerName
If ($OGHostname -eq $NewHostName) {
Write-Output "No need to rename $NewHostName"
Exit 0
                                  }

Else {
Write-Output "Incorrect hostname detected: $OGHostname"
Exit 1
     }
