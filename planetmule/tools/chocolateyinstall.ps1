$ErrorActionPreference = 'Stop'
$packageName = 'planetmule' 
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
# $toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checksum    = '2E1FDB66EA9808D0F56A89A70657F3CC4DD7464DACB5C3EC9B79C49BC3901815'
$Shortcut    = 'Mule.lnk'
$ProgramEXE  = 'mule.exe'

$packageArgs = @{
    PackageName    = $packageName
    FileFullPath   = "$toolsPath\planetmule.zip"
    Destination    = $toolsPath
}

Get-ChocolateyUnzip @packageArgs

Install-ChocolateyShortcut -shortcutFilePath "$env:Public\Desktop\$Shortcut" -targetPath "$toolsPath\Mule\$ProgramEXE" -WorkingDirectory "$toolsPath"
Install-ChocolateyShortcut -shortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\$Shortcut" -targetPath "$toolsPath\Mule\$ProgramEXE"    

Remove-Item "$toolsPath\planetmule.zip" | out-null