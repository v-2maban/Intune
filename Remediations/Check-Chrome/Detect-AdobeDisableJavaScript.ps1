Try {
    $Registry = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown" -ErrorAction Stop).bDisableJavaScript
    If ($Registry -eq 1){
        Write-Host "Compliant"
        Exit 0
    }
    else
    {
    Write-Warning "Not Compliant, initiating remediation script"
    Exit 1
    }
} 
Catch {
    Write-Warning "Registry key does not exist, initiating remediation script"
    Exit 1
}
