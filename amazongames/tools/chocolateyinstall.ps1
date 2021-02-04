$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.amazongames.com/AmazonGamesSetup.exe'
$url64      = 'https://download.amazongames.com/AmazonGamesSetup.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'amazongames*'

  checksum      = '1A99F1054E51FE86416C59E5C526D69776FDABD7BB9831DBAAB8582322121C7A'
  checksumType  = 'sha256'
  checksum64    = '1A99F1054E51FE86416C59E5C526D69776FDABD7BB9831DBAAB8582322121C7A'
  checksumType64= 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
