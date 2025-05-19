<#
Supported models are:
Dell Precision
HP ZBook
Surface devices
Virtual Machine
#>

$CustomComplianceName="*CustomCompliance: Check Model*"


$WMI_ComputerSystem = Get-WMIObject -class Win32_ComputerSystem
$Model = $WMI_ComputerSystem.Model
$ModelSupported = $false

Switch -Regex ($Model) {
    #Dell Precision
    "Precision" { 
    $ModelSupported = $true
                }
    #HP ZBook
    "ZBook" { 
    $ModelSupported = $true
            }
    #Surface
    "Surface" { 
    $ModelSupported = $true
              }
    #Virtual Machine
    "Virtal Machine" { 
    $ModelSupported = $true
                     }
   DEFAULT { 
   $ModelSupported = $false
} 
        }


If ($ModelSupported -eq $true) {
$ModelSupport = @{ModelSupport = "Supported"}
Write-Output "$CustomComplianceName $Model is the supported Model"
return $ModelSupport | ConvertTo-Json -Compress
}

Else {
Write-Output "$CustomComplianceName $Model is not the supported Model"
     }