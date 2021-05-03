$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/Chia-Network/chia-blockchain/releases/download/1.1.3/ChiaSetup-1.1.3.exe'
$process	= "Chia"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'chia-network*'

  checksum      = 'B510A6687E211D77A41BE500988155B5E042CBAAFAFC34B0BA45217A96302C2B'
  checksumType  = 'sha256'

  silentArgs   = '/S'
}

$CheckProcess = Get-Process | Where-Object {$_.ProcessName -eq $process}
If($CheckProcess -eq $null){
	Write-Host "Prozess wird aktuell nicht ausgeführt"
	} 
	else {
	Write-Host "Prozess wird aktuell ausgeführt"
    Stop-Process -Name $process
	}

Install-ChocolateyPackage @packageArgs
