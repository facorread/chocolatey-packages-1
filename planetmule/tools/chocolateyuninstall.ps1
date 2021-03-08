$ErrorActionPreference = 'Stop';
$packageName = 'planetmule' 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$Shortcut    = 'Mule.lnk'


Remove-Item "$env:Public\Desktop\$Shortcut" -Force
Remove-Item "$toolsDir\Mule" -Force
