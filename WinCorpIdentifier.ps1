#(gwmi Win32_ComputerSystem | % { $_.Manufacturer, $_.Model, (gwmi Win32_BIOS).SerialNumber -join ',' })

#Path to Save
$path = "c:\temp"

#Get Model and Manufacturer
$ComputerSystemInfo = Get-WmiObject Win32_ComputerSystem
$ManufacturerValue = $ComputerSystemInfo.Manufacturer
$ModelValue = $ComputerSystem.Model

#Get Serial Number
$BIOSInfo = Get-WmiObject Win32_BIOS
$SerialNumberValue = $BIOSInfo.SerialNumber

#Combining all values
$WinCorpIdentifier = "$ManufacturerValue,$ModelValue,$SerialNumberValue"

$Output CSV
$WinCorpIdentifier | Out-File $path\WinCorpIdentifier.csv
