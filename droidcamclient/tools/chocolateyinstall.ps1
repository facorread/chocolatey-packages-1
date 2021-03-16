$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://files.dev47apps.net/win/DroidCam.Setup.6.4.2.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'droidcamclient*'

  checksum      = 'F5CC6D3A17F67ABBFBEA2B9903B3C3BB977C615CD109078FF6B063BED0D21E60'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
