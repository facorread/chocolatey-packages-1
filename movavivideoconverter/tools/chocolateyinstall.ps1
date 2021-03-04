$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://files.movavi.com/x32/MovaviVideoConverterSetupE.exe'
$url64      = 'https://files.movavi.com/x64/MovaviVideoConverterSetupE.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  softwareName  = 'movavivideoconverter*'
  checksum      = 'D6082219EC5C3C44AB2EF0DB627B19D3C9C8FF51E6E482E009797D8DEE3B40DF'
  checksumType  = 'sha256'
  checksum64    = '5B075B159162643A7A5548A45871F36B8C050CDDB10C0DE47EADD9338A8BE04C'
  checksumType64= 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
