$Output = @()
$OutputList = @()
#Get-IntuneManagedDevice -Filter "operatingsystem eq 'windows'" | get-msgraphallpages | select devicename
$Devices = Get-IntuneManagedDevice -Filter "operatingsystem eq 'windows'" | get-msgraphallpages | Where-Object {$_.configurationManagerClientEnabledFeatures -like "*windowsUpdateForBusiness=True*"}  | select -expandproperty devicename


Foreach ($Device in $Devices) {
Write-Host "Getting workload info for: $Device" -ForegroundColor Green
 $DeviceProp = Get-IntuneManagedDevice -Filter "devicename  eq '$Device'" | get-msgraphallpages | select configurationManagerClientEnabledFeatures

 $Output      = New-Object PSObject -Property @{
                    "DeviceName" = $Device
                    Inventory = $DeviceProp.psobject.Properties.value.inventory
                    modernApps = $DeviceProp.psobject.Properties.value.modernApps
                    resourceAccess = $DeviceProp.psobject.Properties.value.resourceAccess
                    deviceConfiguration = $DeviceProp.psobject.Properties.value.deviceConfiguration
                    compliancePolicy = $DeviceProp.psobject.Properties.value.compliancePolicy
                    windowsUpdateForBusiness = $DeviceProp.psobject.Properties.value.windowsUpdateForBusiness
                    
                    }
                    $OutputList += $Output | Select DeviceName,windowsUpdateForBusiness,deviceConfiguration,resourceAccess,compliancePolicy,Inventory,modernApps
                    
}

$OutputList | ft | Out-File .\DeviceWithWorkload.csv
