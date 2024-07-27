$FilePath="C:\Program Files\VideoLAN\VLC\vlc.exe"
$FileProperties=Get-Item $FilePath
$FileName = $FileProperties.Name
$FileVersion = $FileProperties.VersionInfo.Fileversion

$FileNameExpected="vlc.exe"
$FilePropertiesExpected="3.0.21"


If($FileName -eq $FileNameExpected -and $FileVersion -eq $FilePropertiesExpected){
write-host "Latest VLC Installed"
}
