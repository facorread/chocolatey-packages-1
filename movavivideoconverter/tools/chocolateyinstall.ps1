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
  checksum      = '9461CC9E137054998877E87F5099AB6CFEAF1128F345ED0725EE58A8136B7F3E'
  checksumType  = 'sha256'
  checksum64    = '9461CC9E137054998877E87F5099AB6CFEAF1128F345ED0725EE58A8136B7F3E'
  checksumType64= 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
