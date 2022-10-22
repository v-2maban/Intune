Install-Module AzureAD
Connect-AzureAD
$Devices=Get-Content .\Computers.txt
$OutputList = @()
$Obj = @()


foreach ($Device in $Devices) {
    Write-Host "Searching for: $Device" -ForegroundColor Cyan
    $Obj = Get-AzureADDevice -SearchString $Device | Where-Object {$_.DeviceTrustType -eq 'ServerAd'} | Select -ExpandProperty Objectid
    $Outputlist += Get-AzureADDevice -ObjectId $Obj | Select DisplayName, ObjectId,DeviceTrustType
    #$Objlist += $Obj
}

$OutputList | Out-File .\DevicewithObjectid.csv
$OutputList | Select -ExpandProperty ObjectId | Out-File .\DevicewithObjectidonly.csv
$OutputListAll = Get-AzureADDevice -All $true | Select DisplayName, ObjectId,  DeviceTrustType
$OutputListAll | Out-File .\AllDeviceswithObjectid.csv
