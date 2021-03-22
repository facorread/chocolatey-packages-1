$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://downloads.gamecaster.com/4.0.2012.0902/Gamecaster_Installer_4.0.2012.0902.exe?'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'gamecaster*'
  checksum      = 'DE4183376F12FAF5001D68AC551A393E1F4AB7AF6BD85CD854FE6CA88F5BF9EB'
  checksumType  = 'sha256'
  silentArgs    = "/exenoupdates /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
