$ErrorActionPreference = 'Stop'; # stop on all errors

Get-ScheduledTask -TaskName "ChocoUpgradeNotification" -ErrorAction Ignore | Unregister-ScheduledTask -Confirm:$false