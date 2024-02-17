#Check if Chrome is present
$ChromePresent = $false
If(Test-Path -Path "C:\Program Files\Google\Chrome\Application\chrome.exe") {
Write-Host "Chrome is installed" -ForegroundColor Green
$ChromePresent=$true
}

#Check Chrome Version
$ApprovedChromeVersion=$False
$ApprovedChromeVersions="121.0.6167.141","121.0.6167.140"
$ChromeVersionOnDevice=(Get-Item "C:\Program Files\Google\Chrome\Application\chrome.exe").VersionInfo.ProductVersion
If($ApprovedChromeVersions.Contains($ChromeVersionOnDevice)) {
$ApprovedChromeVersion=$true
Write-Host "$ChromeVersionOnDevice is the approved Chrome version" -ForegroundColor Cyan
}

#Output from all parameters
$CheckChrome = @{"ChromeInstalled"=$ChromePresent;"ApprovedChromeVersion"=$ApprovedChromeVersion}
return $CheckChrome | ConvertTo-Json -Compress