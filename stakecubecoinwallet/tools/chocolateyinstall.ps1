$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/stakecube/StakeCubeCoin/releases/download/v3.0.2/scc-3.0.2-win32-setup.exe'
$url64      = 'https://github.com/stakecube/StakeCubeCoin/releases/download/v3.0.2/scc-3.0.2-win64-setup.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  softwareName  = 'stakecubecoinwallet*'
  checksum      = ''
  checksumType  = 'sha256'
  checksum64    = ''
  checksumType64= 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package

