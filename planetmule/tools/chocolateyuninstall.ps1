$ErrorActionPreference = 'Stop';
$packageName = 'planetmule' 
$Shortcut    = 'Mule.lnk'

Remove-Item -Path "$env:Public\Desktop\$Shortcut"
Remove-Item "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\$Shortcut"
