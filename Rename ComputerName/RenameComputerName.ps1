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
$NewHostName = "AULTD"+"$Serialnumber"
}

## For HP ZBook Models ##
"ZBook" {
Write-Output "This is a $ModelValue Device"
$NewHostName = "AULTH"+"$Serialnumber"
}


## For Microsoft Virtual Machine ##
"Virtual Machine" {
Write-Output "This is a $ModelValue Device"
$FirstCharSerialnumber = $SerialnumberNoHyphen.Substring(0,9)
$NewHostName = "AUVM"+"$FirstCharSerialnumber"
}

                            }

#Rename ComputerName
If($NewHostName -ne $Null) {
Write-Output "Model value is not Null"

#Run the function RenameComputer
RenameComputer
}

Else {
Write-Output "No validation for ComputerName"
}


Function RenameComputer {
If ($OGHostname -eq $NewHostName) {
Write-Output "No need to rename $NewHostName"
                                  }

Else {
Write-Output "Rename required from $OGHostname to $NewHostName"
Rename-Computer -NewName $NewHostName -Force
Start-Sleep -Seconds 60
     }

}
