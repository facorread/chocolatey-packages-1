$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://cdn.movavi.com/x32/MovaviVideoEditorPlusSetupE.exe'
$url64      = 'https://cdn.movavi.com/x64/MovaviVideoEditorPlusSetupE.exe'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  
  softwareName  = 'MovaviVideoEditorPlus*'

  checksum      = '4D3CD5469AE445C7FA1B0AB24FB0A5520112AA4525D1D5321B7A053C31B09603'
  checksumType  = 'sha256'
  checksum64    = '02941990F5177DA5DC818A0F3BC30C53F5386916BB2F06FE0E4F1922F78E4551'
  checksumType64= 'sha256'

  silentArgs   = '/S'
}
Install-ChocolateyPackage @packageArgs
