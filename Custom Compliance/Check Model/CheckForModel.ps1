$SupportedModels=
"Precision 7750",
"Surface Laptop Studio",
"Virtual Machine"

$WMI_ComputerSystem = Get-WMIObject -class Win32_ComputerSystem
$Model = $WMI_ComputerSystem.Model

IF ($Model -in $SupportedModels)
{
Write-Host "$Model is supported Model" -ForegroundColor Green
$ModelSupport = @{ModelSupport = "Supported"}
return $ModelSupport | ConvertTo-Json -Compress

}
Else {
Write-Host "$Model is not supported Model" -ForegroundColor Red
}