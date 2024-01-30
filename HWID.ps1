cmd

:main

color 07
title  Orlebar Brown IT Toolkit
mode 76, 30

echo:
echo:             [1] AutoPilot Install
echo:             [2] Manual AutoPilot
echo:             [3] Upload Autopilot CSV
echo:             [4] Teamviewer Install
echo:             [5] Open Teamviewer
echo:             [6] Help
echo:             [0] Exit
echo:       ______________________________________________________________
echo:
call :_color2 %_White% "          " %_Green% "Enter a menu option in the Keyboard [1,2,3,4,5,0] :"
choice /C:1234560 /N
set _erl=%errorlevel%

if %_erl%==7 exit /b
if %_erl%==6 start https://github.com/rahz/OBAP     & goto :main
if %_erl%==5 setlocal & call :Teamviewer_Open       & cls & endlocal & goto :main
if %_erl%==4 setlocal & call :Teamviewer_Install    & cls & endlocal & goto :main
if %_erl%==3 setlocal & call :Upload_HWID       	& cls & endlocal & goto :main
if %_erl%==2 setlocal & call :HWID_Manual       	& cls & endlocal & goto :main
if %_erl%==1 setlocal & call :AP_Script         	& cls & endlocal & goto :main
goto :main



:HWID_Manual

powershell.exe
//[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
New-Item -Type Directory -Path "C:\IT"
Set-Location -Path "C:\IT"
$env:Path += ";C:\Program Files\WindowsPowerShell\Scripts"
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned
Install-Script -Name Get-WindowsAutopilotInfo
Get-WindowsAutopilotInfo -OutputFile AutopilotHWID.csv
cmd
goto :main

//Send HWID through UFILE (MANUAL)

:Upload_HWID

powershell.exe
$Site = "www.ufile.io"
$Test = Invoke-WebRequest -URI $Site
$Test.Links | Foreach {$_.href }
cmd
goto :main

//AutoPilot Script

:AP_Script

powershell.exe
Set-ExecutionPolicy Bypass
Install-Script -Name Get-WindowsAutoPilotInfo
Get-WindowsAutoPilotInfo -Online -GroupTag AADUserDriven
cmd
goto :main

//Teamviewer Silent Install

:Teamviewer_Install

powershell.exe
$url = "https://download.teamviewer.com/download/TeamViewer_Host_Setup_x64.exe"
$outpath = "C:/IT/Teamviewer_Host.exe"
Invoke-WebRequest -Uri $url -OutFile $outpath
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $outpath)
$args = @("/S","/norestart")
Start-Process -Filepath "C:/IT/Teamviewer_Host.exe" -ArgumentList $args
cmd
goto :main

//Open Teamviewer

:Teamviewer_Open

powershell.exe
Start-Process -Filepath "C:/IT/Teamviewer_Host.exe" -ArgumentList $args
cmd
goto :main