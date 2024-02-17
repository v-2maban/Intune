$SupportedManufacturers="Lenovo","Microsoft Corporation","Dell Inc."
$WMI_ComputerSystem = Get-WMIObject -class Win32_ComputerSystem
$Manufacturer = $WMI_ComputerSystem.Manufacturer

IF ($Manufacturer -in $SupportedManufacturers)
{
$ManufacturerSupport = @{Manufacturer = "Supported"}
Write-Host "Manufacturer is supported" -ForegroundColor Green
return $ManufacturerSupport | ConvertTo-Json -Compress

}
Else {
$ManufacturerSupport = @{Manufacturer = "NotSupported"}
Write-Host "Manufacturer is not supported" -ForegroundColor Red
return $ManufacturerSupport | ConvertTo-Json -Compress
}