$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://s3.amazonaws.com/cb_setups/_current/cbbackup/setup.exe?X-Amz-Expires=604800&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJGX5FT3LRU2F4MBQ/20210111/us-east-1/s3/aws4_request&X-Amz-Date=20210111T124921Z&X-Amz-SignedHeaders=host&response-content-disposition=attachment;filename=CloudBerryBackup_v7.0.0.648DESKTOP_c920681.exe&X-Amz-Signature=f2fcbca97a6d250f36634f91377b878235e031119da56a20119c6a7bf8dc2c69'
$url64      = ''

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  softwareName  = 'cloudberrybackup*'
  checksum      = ''
  checksumType  = 'sha256'
  checksum64    = ''
  checksumType64= 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
