$ErrorActionPreference = 'Stop'
$packageName		= 'stakecubecoinwallet-bootstrap'

$toolsPath			= Split-Path $MyInvocation.MyCommand.Definition
$toolsDir			= "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsDestination = Join-Path $env:appdata "StakeCubeCoin"
$checksum64		    = '83826ACAB663AAF6F26FF552B6DAA0DCDE4A3576FFC48D741DC43061C5FB8C0F'


$packageArgs = @{
    PackageName		= $packageName
    FileFullPath	= "$toolsPath\bootstrap.zip"
    Destination		= $toolsDir
}

Get-ChocolateyWebFile -PackageName 'stakecubecoinwallet-bootstrap' -FileFullPath "$toolsPath\bootstrap.zip" -Url 'https://github.com/stakecube/StakeCubeCoin/releases/download/v3.1.0/bootstrap.zip'
Get-ChocolateyUnzip @packageArgs

New-Item -Path "$toolsDestination" -ItemType directory -Force | Out-Null
Copy-Item "$toolsPath\.scc\*" "$toolsDestination" -recurse
Remove-Item "$toolsPath\.scc" -Recurse


