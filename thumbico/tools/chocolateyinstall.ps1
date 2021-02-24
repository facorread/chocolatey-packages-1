$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.aurelitec.com/thumbico/windows/thumbico-install.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'thumbico*'

  checksum      = '4B7BE6842F95A3252633B30B2AFD292A25D5794FF7C7C1B03B382474B5A3D167'
  checksumType  = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
