winget install JanDeDobbeleer.OhMyPosh -s winget --accept-package-agreements --accept-source-agreements

# Install Powerline Fonts
$installPowerlineFonts = Read-Host "Do you want to install Powerline Fonts? (y/n) : "
if ($installPowerlineFonts -eq "y") {
	powershell oh-my-posh font install --user
}
