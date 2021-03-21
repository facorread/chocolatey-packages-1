﻿$ErrorActionPreference = 'Stop'
$packageName = 'stakecubecoinwallet-bootstrap'

$CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$CurrentUserName = $CurrentUser.split("\")[1]

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsDestination    = "C:\Users\$CurrentUserName\AppData\Roaming\StakeCubeCoin"


$packageArgs = @{
    PackageName    = $packageName
    FileFullPath   = "$toolsPath\bootstrap.zip"
    Destination    = $toolsDir
}

Get-ChocolateyWebFile -PackageName 'stakecubecoinwallet-bootstrap' -FileFullPath "$toolsPath\bootstrap.zip" -Url 'https://github.com/stakecube/StakeCubeCoin/releases/download/v3.1.0/bootstrap.zip'
Get-ChocolateyUnzip @packageArgs