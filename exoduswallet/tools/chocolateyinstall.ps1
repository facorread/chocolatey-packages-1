$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://downloads.exodus.com/releases/exodus-windows-x64-21.2.12.exe'
$url64      = 'https://downloads.exodus.com/releases/exodus-windows-x64-21.2.12.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  softwareName  = 'exoduswallet*'
  checksum      = 'C4C44ECF0BC420AE2FCA550BF66ACD0E54E03C918A31227C4F4401D8C87AFAD0'
  checksumType  = 'sha256'
  checksum64    = 'C4C44ECF0BC420AE2FCA550BF66ACD0E54E03C918A31227C4F4401D8C87AFAD0'
  checksumType64= 'sha256'
  silentArgs   = '/s /v"/qn"'
}

Install-ChocolateyPackage @packageArgs
