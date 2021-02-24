$ErrorActionPreference = 'Stop';
 
$packageName = 'anystream'

$installerType = 'EXE'
$silentArgs = "/S"
$validExitCodes = @(0)

# $file already includes an argument for the source directory. We need to add the silent arguments before
# that argument.
$file = "C:\Program Files\RedFox\AnyStream\AnyStream-uninst.exe" ,($silentArgs+" /D")
 
if ($shouldUninstall) {
 Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -validExitCodes $validExitCodes -File $file
}