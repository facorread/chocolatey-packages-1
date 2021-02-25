$ErrorActionPreference = 'Stop';
 
$packageName = 'anystream*'

$local_key     = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\AnyStream64"
$local_key6432   = "HKCU:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\AnyStream"
$machine_key   = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\AnyStream64"
$machine_key6432 = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\AnyStream"
 
$path  = @($local_key, $local_key6432, $machine_key, $machine_key6432) `
    | ?{ Test-Path $_ } `
    | Get-ItemProperty `
    | Select-Object -ExpandProperty InstallLocation

$installerType = 'EXE'
$validExitCodes = @(0)

$silentArgs = '"' + "/S /D=" + '"' + $path + '"' + '"'
$file = '"' + $path + "\AnyStream-uninst.exe" + '"'

Write-Host "file: " $file
Write-Host "silentArgs: " $silentArgs

if ($shouldUninstall) {
	Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -SilentArgs $silentArgs -validExitCodes $validExitCodes -File $file
	}