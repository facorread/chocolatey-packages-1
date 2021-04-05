$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://www.redfox.bz/download/SetupAnyStream32.exe'
$url64      = 'https://www.redfox.bz/download/SetupAnyStream64.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  softwareName  = 'anystream*'
  checksum      = '0F2A7CC6EC4F5A1F29A6F42551DE5712D59A7D9D4A16BB5A9168E6E7DA53E5A4'
  checksumType  = 'sha256'
  checksum64    = '36D3E8A7CF898C7A5108F8ABE377306C5678FA8D9F7B6D0A50ABBC1679090F3A'
  checksumType64= 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
