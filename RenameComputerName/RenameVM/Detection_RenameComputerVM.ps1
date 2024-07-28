$ManufacturerValue = (Get-WmiObject Win32_ComputerSystem).Manufacturer
$ModelValue = (Get-WmiObject Win32_ComputerSystem).Model

$Serialnumber = (get-wmiobject -class win32_bios).serialnumber
$SerialnumberNoHyphen = $serialnumber.Replace("-","")

$LastCharSerialnumber = $SerialnumberNoHyphen.Remove(0,($SerialnumberNoHyphen.Length -7))
$NewCompName = "AULT-D"+"$LastCharSerialNumber"

$OGHostname=hostname


If ($OGHostname -eq $NewCompName) {
Write-Host "Correct hostname detected for $NewCompName" -ForegroundColor Cyan
exit 0

                                  }

Else {
Write-Host "Incorrect hostname detected, change required from $OGHostname to $NewCompName" -ForegroundColor Red
exit 1
      }

