Import-Module BurntToast

if (!(Get-Command choco -ErrorAction SilentlyContinue))
	{
    New-BurntToastNotification -Text "Choco nicht installiert."
    throw "Choco.exe wird für dieses Scripüt benötigt"
	}

$pkgs = choco outdated --ignore-pinned --ignore-unfound -r
$total = $pkgs.Count

if ( $total -gt 0 )
	{
    $pkgText = ""
    foreach ($package in $pkgs)
		{
        $pkgText += "$($package -split "\|" | Select-Object -First 1), "
		}

    if ($pkgText.Length -gt 103)
		{
        $pkgText = $pkgText.Substring(0, 100)
        $pkgText += "..."
		}
    New-BurntToastNotification -Text "Es sind $total Updates verfügbar:", $pkgText
    }