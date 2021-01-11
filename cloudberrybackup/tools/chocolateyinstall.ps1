$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file_Zip       = Join-Path $toolsDir 'CloudBerryBackup_v7.0.0.648.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  file          = $file_Zip
  softwareName  = 'cloudberrybackup*'
  checksum      = ''
  checksumType  = 'sha256'
  checksum64    = ''
  checksumType64= 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
