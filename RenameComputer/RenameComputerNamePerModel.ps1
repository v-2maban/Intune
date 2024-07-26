$ManufacturerValue = (Get-WmiObject Win32_ComputerSystem).Manufacturer
$ModelValue = (Get-WmiObject Win32_ComputerSystem).Model
$SerialnumberNoHyphen = $serialnumber.Replace("-","")

switch ($ManufacturerValue) {
## For Dell Models ##
"Dell Inc." {
Write-Host "This is a Dell Device" -ForegroundColor Green
$Serialnumber = (get-wmiobject -class win32_bios).serialnumber
$LastCharSerialnumber = $Serialnumber.Remove(0,($Serialnumber.Length -7))
$NewCompName = "AULT-D"+"$LastCharSerialNumber"

$OGHostname=hostname

If ($OGHostname -eq $NewCompName) {
Write-Host "No need to rename $NewCompName" -ForegroundColor Cyan
#exit 0
                                  }

Else {
Write-Host "Rename required from $OGHostname to $NewCompName" -ForegroundColor Red
#exit 1
#Rename-Computer -NewName $NewCompName -Force
#shutdown.exe /g /t 600 /f /c "Restarting the computer"
      }

            }

## For Microsoft ##
"Microsoft" {
Write-Host "This is a Microsoft Device" -ForegroundColor Green
$Serialnumber = (get-wmiobject -class win32_bios).serialnumber
$LastCharSerialnumber = $Serialnumber.Remove(0,($Serialnumber.Length -7))
$NewCompName = "AULT-M"+"$LastCharSerialNumber"

$OGHostname=hostname

If ($OGHostname -eq $NewCompName) {
Write-Host "No need to rename $NewCompName" -ForegroundColor Cyan
#exit 0
                                  }

Else {
Write-Host "Rename required from $OGHostname to $NewCompName" -ForegroundColor Red
#exit 1
#Rename-Computer -NewName $NewCompName -Force
#shutdown.exe /g /t 600 /f /c "Restarting the computer"
      }

            }

                            }

