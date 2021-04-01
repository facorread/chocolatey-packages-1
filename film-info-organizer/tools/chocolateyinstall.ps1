$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/StatusQuo/filminfoorganizer/raw/master/Film%20Info!%20Organizer%20Setup%200.6.1.2.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'film-info-organizer*'
  checksum      = 'AC9DBA07504DEEF286B5D640CDB16318B8F253F34C956E506DDFC3A7F51AC499'
  checksumType  = 'sha256'
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
