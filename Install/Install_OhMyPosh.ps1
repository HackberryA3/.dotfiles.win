winget install JanDeDobbeleer.OhMyPosh -s winget

# Install Powerline Fonts
$installPowerlineFonts = Read-Host "Do you want to install Powerline Fonts? (y/n) : "
if ($installPowerlineFonts -eq "y") {
	oh-my-posh font install --user
}
