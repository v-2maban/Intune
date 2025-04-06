<#
Supported models are:
Dell Precision
Surface devices
Virtual Machine
#>

$WMI_ComputerSystem = Get-WMIObject -class Win32_ComputerSystem
$Model = $WMI_ComputerSystem.Model
$ModelSupported = $true

Switch -Regex ($Model) {
    #Dell Precision
    "Precision" { 
    Write-Output "$Model is supported"}
    #Surface
    "Surfce" { 
    Write-Output "$Model is Supported"}
    #Virtual Machine
    "Virtal Machine" { 
    Write-Output "$Model is Supported"
         }
   DEFAULT { 
   $ModelSupported = $false
} 
        }


If ($ModelSupported -eq $true) {
$ModelSupport = @{ModelSupport = "Supported"}
return $ModelSupport | ConvertTo-Json -Compress
}

Else {
Write-Output "$Model is not the supported Model"

}


