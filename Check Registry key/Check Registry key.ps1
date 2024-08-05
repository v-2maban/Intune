# Define the registry path and value name
$RegistryPath = "HKLM:\Software\ANZ\Autopilot"
$ValueName = "RenameComputerName"


# Check if the registry key exists
if (Test-Path $RegistryPath) {
    Write-Output "Registry key exists: $RegistryPath"

    
    $RegistryValue = Get-ItemProperty -Path $RegistryPath -Name $ValueName -ErrorAction SilentlyContinue
     
    If($RegistryValue.$ValueName -eq "Success"){
    Write-Output "Registry value '$ValueName' exists with value: $($RegistryValue.$ValueName)"
    exit 0
    }
    else {
        Write-Output "Registry value '$ValueName' does not exist."
        exit 1
    }
} else {
    Write-Output "Registry key does not exist: $RegistryPath"
    exit 1
}
