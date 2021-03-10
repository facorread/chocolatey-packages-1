$ErrorActionPreference = 'Stop'
$packageName = 'planetmule'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checksum    = '2E1FDB66EA9808D0F56A89A70657F3CC4DD7464DACB5C3EC9B79C49BC3901815'
$Shortcut    = 'Mule.lnk'
$ProgramEXE  = 'mule.exe'

$packageArgs = @{
    PackageName    = $packageName
    FileFullPath   = "$toolsPath\mule_windows_1.3.6.zip"
    Destination    = $toolsDir
}

Get-ChocolateyWebFile -PackageName 'planetmule' -FileFullPath "$FileFullPath" -Url 'https://kumisystems.dl.sourceforge.net/project/planetmule/1.3.6/mule_windows_1.3.6.zip'
Get-ChocolateyUnzip @packageArgs

Install-ChocolateyShortcut -shortcutFilePath "$env:Public\Desktop\$Shortcut" -targetPath "$toolsDir\Mule\$ProgramEXE" -WorkingDirectory "$toolsDir"
Install-ChocolateyShortcut -shortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\$Shortcut" -targetPath "$toolsDir\Mule\$ProgramEXE"    
