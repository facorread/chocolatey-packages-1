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

  checksum      = '1FF64F79EAF059CE8DD408CF9F5ED724F37414B73D491A9B5C2B6D35539F3AD5'
  checksumType  = 'sha256'
  checksum64    = 'FEEFBF754DCC9ED32329756D37D992939A9AF0547CF6C1074609869F91DDE1D1'
  checksumType64= 'sha256'

  silentArgs   = '/S'
}
Install-ChocolateyPackage @packageArgs
