$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/firoorg/firo/releases/download/v0.14.5.3/firo-0.14.5.3-win64-setup.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  softwareName  = 'firowallet*'
  checksum64    = 'E62FE7FC6B48CE091F590850DEFC58290C92D7BA54F1AA54DBDB4706B6A36C1F'
  checksumType64= 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs

