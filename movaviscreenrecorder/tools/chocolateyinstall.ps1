$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://files.movavi.com/x32/MovaviScreenRecorderSetupE.exe'
$url64      = 'https://files.movavi.com/x64/MovaviScreenRecorderSetupE.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  softwareName  = 'movaviscreenrecorder*'
  checksum      = '85EB42B6CA47B1CD86AD1CB2FF06587642F14D2B4946BEF08B03FC353AB91D86'
  checksumType  = 'sha256'
  checksum64    = '85EB42B6CA47B1CD86AD1CB2FF06587642F14D2B4946BEF08B03FC353AB91D86'
  checksumType64= 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
