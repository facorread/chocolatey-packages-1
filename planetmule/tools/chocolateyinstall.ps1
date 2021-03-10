$ErrorActionPreference = 'Stop'
$packageName = 'planetmule'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$Shortcut    = 'Mule.lnk'
$ProgramEXE  = 'mule.exe'

$packageArgs = @{
    PackageName    = $packageName
    FileFullPath   = "$toolsPath\mule_windows_1.3.6.zip"
    Destination    = $toolsDir
}

Get-ChocolateyWebFile -PackageName 'planetmule' -FileFullPath "$toolsPath\mule_windows_1.3.6.zip" -Url 'https://kumisystems.dl.sourceforge.net/project/planetmule/1.3.6/mule_windows_1.3.6.zip'
Get-ChocolateyUnzip @packageArgs

Install-ChocolateyShortcut -shortcutFilePath "$env:Public\Desktop\$Shortcut" -targetPath "$toolsDir\Mule\$ProgramEXE" -WorkingDirectory "$toolsDir"
Install-ChocolateyShortcut -shortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\$Shortcut" -targetPath "$toolsDir\Mule\$ProgramEXE"    
