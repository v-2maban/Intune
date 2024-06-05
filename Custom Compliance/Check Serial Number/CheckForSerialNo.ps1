$SupportedSerialNumbers=
"4101-0321-5468-5893-4372-6248-71",
"1549-8206-5757-7786-0787-3428-60"

$WMI_BIOS = Get-WMIObject -class Win32_BIOS
$SerialNumber = $WMI_BIOS.SerialNumber

IF ($SerialNumber -in $SupportedSerialNumbers)
{
Write-Host "Serial Number: $SerialNumber is a Corporate device" -ForegroundColor Green
$SerialNumberSupport = @{SerialNumberSupport = "Supported"}
return $SerialNumberSupport | ConvertTo-Json -Compress

}
Else {
Write-Host "Serial Number: $SerialNumber is not a Corporate device" -ForegroundColor Red
$SerialNumberSupport = @{SerialNumberSupport = "Not Supported"}
return $SerialNumberSupport | ConvertTo-Json -Compress
}