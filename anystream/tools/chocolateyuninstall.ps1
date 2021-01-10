$ErrorActionPreference = 'Stop';
 
$packageName = 'anystream'
$shouldUninstall = $true
$file = "C:\Program Files\RedFox\AnyStream\AnyStream-uninst.exe /S"

$installerType = 'EXE'
$silentArgs = "/S"
$validExitCodes = @(0)
 
if ($shouldUninstall) {
 Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -validExitCodes $validExitCodes -File $file
}