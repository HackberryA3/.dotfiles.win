@echo off

cd /d %~dp0

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

pause