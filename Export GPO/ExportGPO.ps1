#Saves the exported GPO (in xml format) under c:\GPOExport
$GPONames = Get-GPO -All | Select-Object DisplayName,Id

ForEach ($GPOName in $GPONames) {
$Filename = $GPOName.DisplayName
$Filepath="c:\GPOExport\"+"$Filename"+".xml"
Get-GPOReport -ReportType Xml -Guid $GPOName.Id -Path $Filepath
Write-Host "Saving Group POlicy: $filename" -ForegroundColor Green
}


