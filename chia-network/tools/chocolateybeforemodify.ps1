$CheckProcess = Get-Process | Where-Object {$_.ProcessName -eq "Chia"}
If($CheckProcess -eq $null){
	Write-Host "Prozess wird aktuell nicht ausgeführt"
	} 
	else {
	Write-Host "Prozess wird aktuell ausgeführt"
    Stop-Process -Name Chia
	}