# Install modules
$LaterThan7_2 = ($PSVersionTable.PSVersion.Major -ge 7) -And ($PSVersionTable.PSVersion.Minor -ge 2)

try { Import-Module -Name PSReadLine }catch {}
try { Import-Module -Name Terminal-Icons }catch {}
try { if ($LaterThan7_2) { Import-Module -Name CompletionPredictor } }catch {}
try {
	Set-PSReadLineOption -EditMode Windows
	Set-PSReadLineOption -PredictionSource HistoryAndPlugin
	Set-PSReadLineOption -PredictionViewStyle ListView
}
catch { Write-Host "Your PSReadLine version does not support the list view and the plugin." }



# Set up the prompt
try { oh-my-posh init pwsh --config https://gist.githubusercontent.com/HackberryA3/23c7b1c51d868de235eb8d39ea556ba9/raw/ReactiveMonokai.omp.yaml | Invoke-Expression }catch {}