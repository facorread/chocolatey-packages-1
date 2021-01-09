$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.movavi.com/download-videoeditorplus21'
$url64      = ''
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  
  softwareName  = 'MovaviVideoEditorPlus*'

  checksum      = ''
  checksumType  = 'sha256'
  checksum64    = ''
  checksumType64= 'sha256'

  silentArgs   = '/S'
}
Install-ChocolateyPackage @packageArgs
