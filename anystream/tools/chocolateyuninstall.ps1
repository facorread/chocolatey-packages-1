$ErrorActionPreference = 'Stop';
 
$packageName = 'anystream'
$registryUninstallerKeyName32 = 'AnyStream32'
$registryUninstallerKeyName64 = 'AnyStream64'
$shouldUninstall = $true
 
$local_key     = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName64"
# local key 6432 probably never exists
$local_key6432   = "HKCU:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName32"
$machine_key   = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName64"
$machine_key6432 = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName32"
 
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

# $file already includes an argument for the source directory. We need to add the silent arguments before
# that argument.
$file = $file -replace "/D",($silentArgs+" /D")
 
if ($shouldUninstall) {
 Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -validExitCodes $validExitCodes -File $file
}