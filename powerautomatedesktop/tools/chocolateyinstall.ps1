$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/b/d/8/bd8409df-7b80-4ef7-89c5-5a7a941a5093/Setup.Microsoft.PowerAutomateDesktop.exe'
$url64      = 'https://download.microsoft.com/download/b/d/8/bd8409df-7b80-4ef7-89c5-5a7a941a5093/Setup.Microsoft.PowerAutomateDesktop.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'powerautomatedesktop*'

  checksum      = '3810DE28CEFBA27F556BDEA663FAF8B526D092920913E7695C4E64213622FE9A'
  checksumType  = 'sha256'
  checksum64    = '3810DE28CEFBA27F556BDEA663FAF8B526D092920913E7695C4E64213622FE9A'
  checksumType64= 'sha256'

  silentArgs   = '/S -accepteula'
}

Install-ChocolateyPackage @packageArgs
