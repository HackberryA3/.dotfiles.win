@echo off

cd /d %~dp0

REM Cleanup//////////////////////////////////////////////////////////////////////////////////////////////
set /p unins_util=Do you want to uninstall Utilities (Camera, VoiceMemo, Clock)? (y/n): 
set /p unins_office=Do you want to uninstall Office (Office, Teams)? (y/n): 
set /p unins_multimedia=Do you want to uninstall Multi media viewer (Clipchamp, Photos, Paint)? (y/n): 
set /p unins_entertainment=Do you want to uninstall Entertainment (Disney+, Spotify, Movie, TV)? (y/n): 
set /p unins_xbox=Do you want to uninstall Xbox (Xbox, XboxGameOverlay)? (y/n): 

if "%unins_util%"=="y" (
	echo Uninstalling Utilities...
	powershell -ExecutionPolicy RemoteSigned -File Uninstall_Utility.ps1
	echo Done.
) else (
	echo Skipping Utilities.
)
if "%unins_office%"=="y" (
	echo Uninstalling Office...
	powershell -ExecutionPolicy RemoteSigned -File Uninstall_Office.ps1
	echo Done.
) else (
	echo Skipping Office.
)
if "%unins_multimedia%"=="y" (
	echo Uninstalling Multimedia...
	powershell -ExecutionPolicy RemoteSigned -File Uninstall_MultimediaViewer.ps1
	echo Done.
) else (
	echo Skipping Multimedia.
)
if "%unins_entertainment%"=="y" (
	echo Uninstalling Entertainment...
	powershell -ExecutionPolicy RemoteSigned -File Uninstall_Entertainment.ps1
	echo Done.
) else (
	echo Skipping Entertainment.
)
if "%unins_xbox%"=="y" (
	echo Uninstalling Xbox...
	powershell -ExecutionPolicy RemoteSigned -File Uninstall_Xbox.ps1
	echo Done.
) else (
	echo Skipping Xbox.
)

REM Powershell//////////////////////////////////////////////////////////////////////////////////////////////
set /p ins_ps=Do you want to install the latest Powershell? (y/n): 
if "%ins_ps%"=="y" (
	echo Installing Powershell...
	powershell winget install Microsoft.PowerShell
	echo Done.
) else (
	echo Skipping Powershell.
)

set /p ins_psmodule=Do you want to install Powershell Modules? (y/n): 
if "%ins_psmodule%"=="y" (
	echo Installing Powershell Modules...
	powershell -ExecutionPolicy RemoteSigned -File Install_PSModule.ps1 -ForPWSH True
	echo Done.
) else (
	echo Skipping Powershell Modules.
)

set /p ins_omp=Do you want to install Oh My Posh? (y/n): 
if "%ins_omp%"=="y" (
	echo Installing Oh My Posh...
	powershell -ExecutionPolicy RemoteSigned -File Install_OhMyPosh.ps1
	echo Done.
) else (
	echo Skipping Oh My Posh.
)

set /p ins_psprofile=Do you want to install Powershell Profile? (y/n): 
if "%ins_psprofile%"=="y" (
	echo Installing Powershell Profile...
	if not exist "%USERPROFILE%\Documents\Powershell" mkdir "%USERPROFILE%\Documents\Powershell"
	if exist "%USERPROFILE%\Documents\Powershell\Microsoft.Powershell_profile.ps1" del "%USERPROFILE%\Documents\Powershell\Microsoft.Powershell_profile.ps1"
	if exist "%USERPROFILE%\Documents\WindowsPowershell\Microsoft.Powershell_profile.ps1" del "%USERPROFILE%\Documents\WindowsPowershell\Microsoft.Powershell_profile.ps1"
	if exist "%USERPROFILE%\Documents\Powershell\Microsoft.VSCode_profile.ps1" del "%USERPROFILE%\Documents\Powershell\Microsoft.VSCode_profile.ps1"
	mklink /H "%USERPROFILE%\Documents\Powershell\Microsoft.Powershell_profile.ps1" "..\Microsoft.Powershell_profile.ps1"
	mklink /H "%USERPROFILE%\Documents\WindowsPowershell\Microsoft.Powershell_profile.ps1" "..\Microsoft.Powershell_profile.ps1"
	mklink /H "%USERPROFILE%\Documents\Powershell\Microsoft.VSCode_profile.ps1" "..\Microsoft.Powershell_profile.ps1"
	echo Done.
) else (
	echo Skipping Powershell Profile.
)

set /p ins_wtprofile=Do you want to install Windows Terminal Profile? (y/n): 
if "%ins_wtprofile%"=="y" (
	echo Installing Windows Terminal Profile...
	REM Search for Windows Terminal folder
	for /D %%G in ("%USERPROFILE%\AppData\Local\Packages\Microsoft.WindowsTerminal*") do (
		REM Make symbolic link from ../WindowsTerminal_profile.json to settings.json
		if exist "%%G\LocalState\settings.json" del "%%G\LocalState\settings.json"
		mklink /H "%%G\LocalState\settings.json" "..\WindowsTerminal_profile.json"
	)
	echo Done.
) else (
	echo Skipping Windows Terminal Profile.
)



REM Ask//////////////////////////////////////////////////////////////////////////////////////////////
set /p ins_geforce=Do you want to install GeForce Experience? (y/n): 
set /p ins_icue=Do you want to install iCUE? (y/n): 
set /p ins_razersynapse=Do you want to install Razer Synapse? (y/n): 

set /p ins_authy=Do you want to install Authy? (y/n): 
set /p ins_bitwarden=Do you want to install Bitwarden? (y/n): 

set /p ins_chrome=Do you want to install Google Chrome? (y/n): 
set /p ins_firefox=Do you want to install Mozilla Firefox? (y/n): 

set /p ins_onedrive=Do you want to install OneDrive? (y/n): 
set /p ins_dropbox=Do you want to install Dropbox? (y/n): 
set /p ins_gdrive=Do you want to install Google Drive? (y/n): 

set /p ins_git=Do you want to install Git? (y/n): 
set /p ins_gh=Do you want to install Github CLI? (y/n): 

set /p ins_vscode=Do you want to install Visual Studio Code? (y/n): 
set /p ins_vs=Do you want to install Visual Studio? (y/n): 
set /p ins_vim=Do you want to install Vim? (y/n): 

set /p java=Do you want to install Java? (y/n): 
:java_version
set /p javaV=Which version of Java do you want to install? (11/16/21): 
if "%javaV%"=="11" (
	echo Java 11 selected.
) else if "%javaV%"=="16" (
	echo Java 16 selected.
) else if "%javaV%"=="21" (
	echo Java 21 selected.
) else (
	echo Invalid Java version. Please select 11, 16, or 21.
	goto java_version
)

set /p python=Do you want to install Python3? (y/n): 
:python_version
set /p pythonV=Which version of Python do you want to install? 3.(0-12): 
if "%pythonV%"=="0" (
	echo Python 3.0 selected.
) else if "%pythonV%"=="1" (
	echo Python 3.1 selected.
) else if "%pythonV%"=="2" (
	echo Python 3.2 selected.
) else if "%pythonV%"=="3" (
	echo Python 3.3 selected.
) else if "%pythonV%"=="4" (
	echo Python 3.4 selected.
) else if "%pythonV%"=="5" (
	echo Python 3.5 selected.
) else if "%pythonV%"=="6" (
	echo Python 3.6 selected.
) else if "%pythonV%"=="7" (
	echo Python 3.7 selected.
) else if "%pythonV%"=="8" (
	echo Python 3.8 selected.
) else if "%pythonV%"=="9" (
	echo Python 3.9 selected.
) else if "%pythonV%"=="10" (
	echo Python 3.10 selected.
) else if "%pythonV%"=="11" (
	echo Python 3.11 selected.
) else if "%pythonV%"=="12" (
	echo Python 3.12 selected.
) else (
	echo Invalid Python version. Please select 0-12.
	goto python_version
)

set /p node=Do you want to install Node.js? (y/n): 

set /p dotnet=Do you want to install .NET? (y/n): 
:dotnet_version
set /p dotnetV=Which version of .NET do you want to install? (7/8): 
if "%dotnetV%"=="7" (
	echo .NET 7 selected.
) else if "%dotnetV%"=="8" (
	echo .NET 8 selected.
) else (
	echo Invalid .NET version. Please select 7 or 8.
	goto dotnet_version
)

set /p ins_virtualbox=Do you want to install VirtualBox? (y/n): 
set /p ins_docker=Do you want to install Docker? (y/n): 

set /p ins_office=Do you want to install Microsoft Office(Only Excel, Word, Powerpoint)? (y/n): 
set /p ins_onenote=Do you want to install Microsoft OneNote? (y/n): 
set /p ins_teams=Do you want to install Microsoft Teams? (y/n): 
set /p ins_zoom=Do you want to install Zoom? (y/n): 

set /p ins_adobe=Do you want to install Adobe Creative Cloud? (y/n): 
set /p ins_blender=Do you want to install Blender? (y/n): 
set /p ins_unity=Do you want to install Unity? (y/n): 
set /p ins_unreal=Do you want to install Unreal Engine? (y/n): 

set /p ins_steam=Do you want to install Steam? (y/n): 
set /p ins_epic=Do you want to install Epic Games? (y/n): 
set /p ins_minecraft=Do you want to install Minecraft? (y/n): 
set /p ins_blitz=Do you want to install Blitz.gg? (y/n): 

set /p ins_notion=Do you want to install Notion? (y/n): 
set /p ins_spotify=Do you want to install Spotify? (y/n): 

set /p ins_line=Do you want to install LINE? (y/n): 
set /p ins_discord=Do you want to install Discord? (y/n): 



REM Driver//////////////////////////////////////////////////////////////////////////////////////////////
if "%ins_geforce%"=="y" (
	echo Installing GeForce Experience...
	powershell winget install NVIDIA.GeForceExperience
	echo Done.
) else (
	echo Skipping GeForce Experience.
)
if "%ins_icue%"=="y" (
	echo Installing iCUE...
	powershell winget install Corsair.iCUE.4
	echo Done.
) else (
	echo Skipping iCUE.
)
if "%ins_razersynapse%"=="y" (
	echo Installing Razer Synapse...
	powershell winget install RazerInc.RazerInstaller
	echo Done.
) else (
	echo Skipping Razer Synapse.
)

REM Authentication//////////////////////////////////////////////////////////////////////////////////////////////
if "%ins_authy%"=="y" (
	echo Installing Authy...
	powershell winget install Twilio.Authy
	echo Done.
) else (
	echo Skipping Authy.
)
if "%ins_bitwarden%"=="y" (
	echo Installing Bitwarden...
	powershell winget install Bitwarden.Bitwarden
	echo Done.
) else (
	echo Skipping Bitwarden.
)

REM Browser//////////////////////////////////////////////////////////////////////////////////////////////
if "%ins_chrome%"=="y" (
	echo Installing Google Chrome...
	powershell winget install Google.Chrome
	echo Done.
) else (
	echo Skipping Google Chrome.
)
if "%ins_firefox%"=="y" (
	echo Installing Mozilla Firefox...
	powershell winget install Mozilla.Firefox
	echo Done.
) else (
	echo Skipping Mozilla Firefox.
)

REM Cloud//////////////////////////////////////////////////////////////////////////////////////////////
if "%ins_onedrive%"=="y" (
	echo Installing OneDrive...
	powershell winget install Microsoft.OneDrive
	echo Done.
) else (
	echo Skipping OneDrive.
)
if "%ins_dropbox%"=="y" (
	echo Installing Dropbox...
	powershell winget install Dropbox.Dropbox
	echo Done.
) else (
	echo Skipping Dropbox.
)
if "%ins_gdrive%"=="y" (
	echo Installing Google Drive...
	powershell winget install Google.GoogleDrive
	echo Done.
) else (
	echo Skipping Google Drive.
)

if "%ins_git%"=="y" (
	echo Installing Git...
	powershell winget install Git.Git
	echo Done.
) else (
	echo Skipping Git.
)
if "%ins_gh%"=="y" (
	echo Installing Github CLI...
	powershell winget install GitHub.cli
	echo Done.
) else (
	echo Skipping Github CLI.
)

REM Development//////////////////////////////////////////////////////////////////////////////////////////////
if "%ins_vscode%"=="y" (
	echo Installing Visual Studio Code...
	powershell winget install Microsoft.VisualStudioCode
	echo Done.
) else (
	echo Skipping Visual Studio Code.
)
if "%ins_vs%"=="y" (
	echo Installing Visual Studio...
	powershell winget install Microsoft.VisualStudio.2022.Community
	echo Done.
) else (
	echo Skipping Visual Studio.
)
if "%ins_vim%"=="y" (
	echo Installing Vim...
	powershell winget install vim.vim
	echo Done.
) else (
	echo Skipping Vim.
)

REM Programming//////////////////////////////////////////////////////////////////////////////////////////////
if "%java%"=="y" (
	echo Installing Java...
	powershell winget install Microsoft.OpenJDK.%javaV%
	echo Done.
) else (
	echo Skipping Java.
)
if "%python%"=="y" (
	echo Installing Python3...
	powershell winget install Python.Python.3.%pythonV%
	echo Done.
) else (
	echo Skipping Python3.
)
if "%node%"=="y" (
	echo Installing Node.js...
	powershell winget install OpenJS.NodeJS
	echo Done.
) else (
	echo Skipping Node.js.
)
if "%dotnet%"=="y" (
	echo Installing .NET...
	powershell winget install Microsoft.DotNet.SDK.%dotnetV%
	echo Done.
) else (
	echo Skipping .NET.
)

REM Virtualization//////////////////////////////////////////////////////////////////////////////////////////////
if "%ins_virtualbox%"=="y" (
	echo Installing VirtualBox...
	powershell winget install Oracle.VirtualBox
	echo Done.
) else (
	echo Skipping VirtualBox.
)
if "%ins_docker%"=="y" (
	echo Installing Docker...
	powershell winget install Docker.DockerDesktop
	echo Done.
) else (
	echo Skipping Docker.
)

REM Office//////////////////////////////////////////////////////////////////////////////////////////////
if "%ins_office%"=="y" (
	if "%ins_onenote%"=="y" (
		echo Installing Microsoft Office with OneNote...
		powershell winget install Microsoft.Office --override "/configure OfficeConfig/OnlyExcelWordPowerpointOnenote.xml"
		echo Done.
	) else (
		echo Installing Microsoft Office...
		powershell winget install Microsoft.Office --override "/configure OfficeConfig/OnlyExcelWordPowerpoint.xml"
		echo Done.
	)
) else if "%ins_onenote%"=="y" (
	echo Installing OneNote...
	powershell winget install Microsoft.Office --override "/configure OfficeConfig/OnlyOnenote.xml"
	echo Done.
) else (
	echo Skipping Microsoft Office and OneNote.
)
if "%ins_teams%"=="y" (
	echo Installing Microsoft Teams...
	powershell winget install Microsoft.Teams
	echo Done.
) else (
	echo Skipping Microsoft Teams.
)
if "%ins_zoom%"=="y" (
	echo Installing Zoom...
	powershell winget install Zoom.Zoom
	echo Done.
) else (
	echo Skipping Zoom.
)

REM Creative//////////////////////////////////////////////////////////////////////////////////////////////
if "%ins_adobe%"=="y" (
	echo Installing Adobe Creative Cloud...
	powershell winget install "Adobe Creative Cloud"
	echo Done.
) else (
	echo Skipping Adobe Creative Cloud.
)
if "%ins_blender%"=="y" (
	echo Installing Blender...
	powershell winget install BlenderFoundation.Blender
	echo Done.
) else (
	echo Skipping Blender.
)
if "%ins_unity%"=="y" (
	echo Installing Unity...
	powershell winget install Unity.UnityHub
	echo Done.
) else (
	echo Skipping Unity.
)
if "%ins_unreal%"=="y" (
	echo Installing Unreal Engine...
	powershell winget install EpicGames.EpicGamesLauncher
	echo Done.
) else (
	echo Skipping Unreal Engine.
)

REM Game//////////////////////////////////////////////////////////////////////////////////////////////
if "%ins_steam%"=="y" (
	echo Installing Steam...
	powershell winget install Valve.Steam
	echo Done.
) else (
	echo Skipping Steam.
)
if "%ins_epic%"=="y" (
	if not "%ins_unreal%"=="y" (
		echo Installing Unreal Engine...
		powershell winget install EpicGames.EpicGamesLauncher
		echo Done.
	)
) else (
	echo Skipping Epic Games.
)
if "%ins_minecraft%"=="y" (
	echo Installing Minecraft...
	powershell winget install Mojang.MinecraftLauncher
	echo Done.
) else (
	echo Skipping Minecraft.
)
if "%ins_blitz%"=="y" (
	echo Installing Blitz.gg...
	powershell winget install Blitz.Blitz
	echo Done.
) else (
	echo Skipping Blitz.gg.
)

REM Other//////////////////////////////////////////////////////////////////////////////////////////////
if "%ins_notion%"=="y" (
	echo Installing Notion...
	powershell winget install Notion.Notion
	echo Done.
) else (
	echo Skipping Notion.
)
if "%ins_spotify%"=="y" (
	echo Installing Spotify...
	powershell winget install Spotify.Spotify
	echo Done.
) else (
	echo Skipping Spotify.
)

REM Communication//////////////////////////////////////////////////////////////////////////////////////////////
if "%ins_line%"=="y" (
	echo Installing LINE...
	powershell winget install LINE.LINE
	echo Done.
) else (
	echo Skipping LINE.
)
if "%ins_discord%"=="y" (
	echo Installing Discord...
	powershell winget install Discord.Discord
	echo Done.
) else (
	echo Skipping Discord.
)

REM Setup//////////////////////////////////////////////////////////////////////////////////////////////
set /p setup_git=Do you want to setup Git? (y/n):

if "%setup_git%"=="y" (
	echo Setting up Git...
	powershell -ExecutionPolicy RemoteSigned -File SetUp_Github.ps1
	echo Done.
) else (
	echo Skipping Git setup.
)

pause