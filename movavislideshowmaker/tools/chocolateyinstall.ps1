$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://files.movavi.com/x32/MovaviSlideshowMakerSetup.exe'
$url64      = 'https://files.movavi.com/x64/MovaviSlideshowMakerSetup.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  softwareName  = 'movavislideshowmaker*'
  checksum      = '4E68456FC7D36CCF035A684D427955CA9A7977B360321E8E6820ABC7028393F4'
  checksumType  = 'sha256'
  checksum64    = '4E68456FC7D36CCF035A684D427955CA9A7977B360321E8E6820ABC7028393F4'
  checksumType64= 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
