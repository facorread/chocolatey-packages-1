$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://downloads.gamecaster.com/4.0.2012.0901/Gamecaster_Installer_4.0.2012.0901.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'gamecaster*'
  checksum      = '0F4A49EB0B2C44E219C42034DF9BFA1BF3D6D05987C20685CD6F3A53B6FA6BC4'
  checksumType  = 'sha256'
  silentArgs    = "/exenoupdates /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
