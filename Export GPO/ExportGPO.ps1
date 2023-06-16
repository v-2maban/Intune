#$gponames = get-gpo -all | Where-Object {$_.DisplayName -like '*Desktop*'} | Select DisplayName,Id
$gponames = get-gpo -all | Select DisplayName,Id
ForEach ($gponame in $gponames)
{
$filename=$gponame.displayname
$filepath="c:\gpo\export\"+"$filename"+".xml"
Get-GPOReport -ReportType xml -Guid $gponame.Id -Path $filepath
Write-Host "Saving Group POlicy: $filename" -ForegroundColor Green
}