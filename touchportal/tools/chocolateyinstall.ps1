$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.touch-portal.com/downloads/TouchPortal_Setup.exe'
$url64      = 'https://www.touch-portal.com/downloads/TouchPortal_Setup.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'touchportal*'

  checksum      = '88379D1C3D37504673C9D7DC3CBA5F8371DC6FEBA010230F1B7698BA47AD2C8D'
  checksumType  = 'sha256'
  checksum64    = '88379D1C3D37504673C9D7DC3CBA5F8371DC6FEBA010230F1B7698BA47AD2C8D'
  checksumType64= 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
