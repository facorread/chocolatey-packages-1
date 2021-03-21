$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/stakecube/StakeCubeCoin/releases/download/v3.1.0/scc-3.1.0-win64-setup.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  softwareName  = 'stakecubecoinwallet*'
  checksum64    = '8A8178EE45DC2286344CD6606733035C8CF4E8BEFE4F9A53B32840E2C0C0A5C2'
  checksumType64= 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs

