$ErrorActionPreference = 'Stop';
$packageName = 'planetmule' 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$Shortcut    = 'Mule.lnk'


Remove-Item -Path "$env:Public\Desktop\$Shortcut" -Y
Remove-Item "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\$Shortcut" -Y
Remove-Item "$toolsDir\Mule" -Recurse -Force -Y
