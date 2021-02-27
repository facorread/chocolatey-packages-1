$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/stakecube/StakeCubeCoin/releases/download/v3.0.2/scc-3.0.2-win32-setup.exe'
$url64      = 'https://github.com/stakecube/StakeCubeCoin/releases/download/v3.0.2/scc-3.0.2-win64-setup.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  softwareName  = 'stakecubecoinwallet*'
  checksum      = 'D94C1CEFA8EED85B87220BAA07E28315C17806FD76B3324CD46EE6A680C74952'
  checksumType  = 'sha256'
  checksum64    = '7C6B11A786F5A4F4CF18A47532CED74B8CAD0A77E71ADC6B90A64283E06681EF'
  checksumType64= 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs

