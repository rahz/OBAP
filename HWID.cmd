@echo off

:init

REM CREATE SCRIPTS AND DIRECTORIES

REM FOLDER CREATION
mkdir C:\IT\HWID\Choices
cd C:\IT\HWID\Choices
powershell.exe Invoke-WebRequest -Uri https://raw.githubusercontent.com/rahz/OBAP/main/Choices/AP_Install.ps1 -OutFile C:\IT\HWID\Choices\AP_Install.ps1
powershell.exe Invoke-WebRequest -Uri https://raw.githubusercontent.com/rahz/OBAP/main/Choices/HWID_Manual.ps1 -OutFile C:\IT\HWID\Choices\HWID_Manual.ps1
powershell.exe Invoke-WebRequest -Uri https://raw.githubusercontent.com/rahz/OBAP/main/Choices/Teamviewer_Install.ps1 -OutFile C:\IT\HWID\Choices\Teamviewer_Install.ps1
powershell.exe Invoke-WebRequest -Uri https://raw.githubusercontent.com/rahz/OBAP/main/Choices/Open_Teamviewer.ps1 -OutFile C:\IT\HWID\Choices\Open_Teamviewer.ps1
powershell.exe Invoke-WebRequest -Uri https://raw.githubusercontent.com/rahz/OBAP/main/Choices/Upload_HWID.ps1 -OutFile C:\IT\HWID\Choices\Upload_HWID.ps1
cd ..
powershell.exe Invoke-WebRequest -Uri https://raw.githubusercontent.com/rahz/OBAP/main/HWID.ps1 -OutFile C:\IT\HWID\HWID.ps1

goto :main

:main

color 07
title  Orlebar Brown IT Toolkit
mode 76, 30

echo:
echo:
echo:       ______________________________________________________________
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
call "Enter a menu option in the Keyboard [1,2,3,4,5,6,7,0] :"
choice /C:12345670 /N
set _erl=%errorlevel%

if %_erl%==8 exit /b
if %_erl%==7 shutdown -r & echo: "Restarting..."
if %_erl%==6 start https://github.com/rahz/OBAP     & goto :main
if %_erl%==5 setlocal & call :Teamviewer_Open       & cls & endlocal & goto :main
if %_erl%==4 setlocal & call :Teamviewer_Install    & cls & endlocal & goto :main
if %_erl%==3 setlocal & call :Upload_HWID       	& cls & endlocal & goto :main
if %_erl%==2 setlocal & call :HWID_Manual       	& cls & endlocal & goto :main
if %_erl%==1 setlocal & call :AP_Script         	& cls & endlocal & goto :main
goto :main



:HWID_Manual


REM [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
REM New-Item -Type Directory -Path "C:\IT"
REM Set-Location -Path "C:\IT"
REM $env:Path += ";C:\Program Files\WindowsPowerShell\Scripts"
REM Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned
REM Install-Script -Name Get-WindowsAutopilotInfo
REM Get-WindowsAutopilotInfo -OutputFile AutopilotHWID.csv
REM exit
REM echo: "File has been outputted to C:\IT\AutopilotHWID.csv"

goto :main

REM Send HWID through UFILE (MANUAL)

:Upload_HWID

$Site = "www.ufile.io"
$Test = Invoke-WebRequest -URI $Site
$Test.Links | Foreach {$_.href }
exit
goto :main

REM AutoPilot Script

:AP_Script

powershell.exe
Set-ExecutionPolicy Bypass
Install-Script -Name Get-WindowsAutoPilotInfo
Get-WindowsAutoPilotInfo -Online -GroupTag AADUserDriven
exit
cmd
goto :main

REM Teamviewer Silent Install

:Teamviewer_Install

$url = "https://download.teamviewer.com/download/TeamViewer_Host_Setup_x64.exe"
$outpath = "C:/IT/Teamviewer_Host.exe"
Invoke-WebRequest -Uri $url -OutFile $outpath
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $outpath)
$args = @("/S","/norestart")
Start-Process -Filepath "C:/IT/Teamviewer_Host.exe" -ArgumentList $args
exit
goto :main

REM Open Teamviewer

:Teamviewer_Open


Start-Process -Filepath "C:/IT/Teamviewer_Host.exe" -ArgumentList $args
exit
goto :main
