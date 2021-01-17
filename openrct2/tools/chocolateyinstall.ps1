$ErrorActionPreference = 'Stop'

$softwareName = "openrct2"


$packageArgs = @{
  packageName   = 'OpenRCT2'
  fileType      = 'exe'
  url           = 'https://github.com/OpenRCT2/OpenRCT2/releases/download/v0.3.2/OpenRCT2-0.3.2-windows-installer-win32.exe'
  checksum      = 'c824ca609310d436577693dc858795580431fa30dced39e13fb95eb6ad9717dd'
  checksumType  = 'sha256'
  silentArgs    = "/S"
  validExitCodes= @(0,1223)
}
# treat 1223 as valid, if it's an upgrade the forced upgrade pop-up window causes an 1223 exit code

$systemIs64bit = (Get-WmiObject Win32_Processor).AddressWidth -eq 64

function Get-32bitOpenRCT2Installed() {

  if (-Not $systemIs64bit) {
    return $false
  }

  $registryPaths = @(
    'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall'
    'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall'
  )

  ForEach ($path in $registryPaths) {
    $installed = Get-ChildItem -Path $path | ForEach { Get-ItemProperty $_.PSPath } | Where-Object { $_.DisplayName -match "OpenRCT2" } | Select-Object -Property DisplayName,DisplayVersion,"Install Folder"
    if(!$installed -eq $null) {
      ForEach ($app in $installed) {
        $OpenRCT2InstallLocation = "$($app."Install Folder")"
      }
    }
    else {
      # Not installed
      return $false
    }
  }

  $OpenRCT2Uninstaller = Get-ChildItem "$($OpenRCT2InstallLocation)\uninstall.exe" | % {$_.VersionInfo} | Select FileVersion

  if($OpenRCT2Uninstaller.FileVersion -like '*win64') {
    # Write-Output "x64 version is installed: $($OpenRCT2Uninstaller.FileVersion)";
    return $false;
  }
  if($OpenRCT2Uninstaller.FileVersion -like '*win32') {
    # Write-Output "x86 version is installed: $($OpenRCT2Uninstaller.FileVersion)";
    return $true;
  }
}

if (Get-32bitOpenRCT2Installed) {
  Write-Output $(
    'Detected the 32-bit version of OpenRCT2 on a 64-bit system. ' +
    'This package will continue to install the 32-bit version of OpenRCT2 ' +
    'unless the 32-bit version is uninstalled.'
    )
}

if (!(Get-32bitOpenRCT2Installed) -and ($systemIs64bit)) {
  $packageArgs.Url64 = "https://github.com/OpenRCT2/OpenRCT2/releases/download/v0.3.2/OpenRCT2-0.3.2-windows-installer-x64.exe"
  $packageArgs.Checksum64 = "bc93ba363f350aca688722679010a620cbedc2f647d26f56f009a64a67c42446"
}
Install-ChocolateyPackage @packageArgs