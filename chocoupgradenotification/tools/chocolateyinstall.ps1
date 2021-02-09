$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$action = New-ScheduledTaskAction -Execute 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe' -Argument "-NoProfile -WindowStyle Hidden -ExecutionPolicy unrestricted -File ""$($toolsDir)\Get-ChocoUpgradeNotification.ps1"" "

$trigger1 = New-ScheduledTaskTrigger -Daily -At 11am
$trigger2 = New-ScheduledTaskTrigger -AtLogOn

# Register scheduled task and run it immediately
Register-ScheduledTask -Action $action -Trigger $trigger1, $trigger2 -TaskName "ChocoUpgradeNotification" -Description "Daily check for Choco Package Updates" | Start-ScheduledTask