$ErrorActionPreference = 'Stop';
 
$packageName = 'anystream'
$registryUninstallerKeyName_32 = 'AnyDVD'
$registryUninstallerKeyName_64 = 'AnyDVD64'
$shouldUninstall = $true
 
$local_key     = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName_64"
$local_key6432   = "HKCU:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName_32"
$machine_key   = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName_64"
$machine_key6432 = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName_32"
 
$file = @($local_key, $local_key6432, $machine_key, $machine_key6432) `
    | ?{ Test-Path $_ } `
    | Get-ItemProperty `
    | Select-Object -ExpandProperty UninstallString
 
if ($file -eq $null -or $file -eq '') {
    Write-Host "$packageName has already been uninstalled by other means."
    $shouldUninstall = $false
}

$installerType = 'EXE'
$silentArgs = "/S"
$validExitCodes = @(0)

$file = $file -replace "/D",($silentArgs+" /D")
 
if ($shouldUninstall) {
 Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -validExitCodes $validExitCodes -File $file
}