#Create c:\temp folder if doesn't exists
$path = "c:\temp"
If(!(Test-Path -PathType container $path))
{
    New-Item -ItemType Directory -Path $path
}


#Get Model and Manufacturer
$ComputerSystemInfo = Get-WmiObject Win32_ComputerSystem
$ManufacturerValue = $ComputerSystemInfo.Manufacturer
$ModelValue = $ComputerSystemInfo.Model

#Get Serial Number
$BIOSInfo = Get-WmiObject Win32_BIOS
$SerialNumberValue = $BIOSInfo.SerialNumber

#Combining all values
$WinCorpIdentifier = "$ManufacturerValue,$ModelValue,$SerialNumberValue"

#Output CSV
$WinCorpIdentifier | Out-File $path\WinCorpIdentifier.csv
