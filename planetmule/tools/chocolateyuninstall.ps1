﻿$ErrorActionPreference = 'Stop';
$packageName = 'planetmule' 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$Shortcut    = 'Mule.lnk'


Remove-Item -Path "$env:Public\Desktop\$Shortcut"
Remove-Item "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\$Shortcut" -Force -Confirm
Remove-Item "$toolsDir\Mule" -Recurse -Force -Confirm
