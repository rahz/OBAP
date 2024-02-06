@echo off


REM ** Script created by Rahul Khimani - Feb 2024












:init

powershell.exe Set-ExecutionPolicy Bypass
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
powershell.exe Invoke-WebRequest -Uri https://raw.githubusercontent.com/rahz/OBAP/main/HWID.cmd -OutFile C:\IT\HWID\HWID.cmd

goto :main

:main

color 07
title  Orlebar Brown IT Toolkit
mode 76, 30

echo:
echo:
echo	██████╗ ██████╗ ██╗     ███████╗██████╗  █████╗ ██████╗     ██████╗ ██████╗  ██████╗ ██╗    ██╗███╗   ██╗    ██╗████████╗
echo	██╔═══██╗██╔══██╗██║     ██╔════╝██╔══██╗██╔══██╗██╔══██╗    ██╔══██╗██╔══██╗██╔═══██╗██║    ██║████╗  ██║    ██║╚══██╔══╝
echo	██║   ██║██████╔╝██║     █████╗  ██████╔╝███████║██████╔╝    ██████╔╝██████╔╝██║   ██║██║ █╗ ██║██╔██╗ ██║    ██║   ██║   
echo	██║   ██║██╔══██╗██║     ██╔══╝  ██╔══██╗██╔══██║██╔══██╗    ██╔══██╗██╔══██╗██║   ██║██║███╗██║██║╚██╗██║    ██║   ██║   
echo	╚██████╔╝██║  ██║███████╗███████╗██████╔╝██║  ██║██║  ██║    ██████╔╝██║  ██║╚██████╔╝╚███╔███╔╝██║ ╚████║    ██║   ██║   
echo	╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝    ╚═════╝ ╚═╝  ╚═╝ ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═══╝    ╚═╝   ╚═╝   
echo:                                                                                                                         
echo:
echo:       	______________________________________________________________
echo:
echo:             	[1] AutoPilot Install
echo:             	[2] Manual AutoPilot
echo:             	[3] Upload Autopilot CSV
echo:             	[4] Teamviewer Install
echo:             	[5] Open Teamviewer
echo:             	[6] Help
echo:             	[7] Restart Device
echo:             	[0] Exit
echo:       	______________________________________________________________
echo:
echo: "Enter a menu option in the Keyboard [1,2,3,4,5,6,7,0] :"
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

REM Manual HWID Export
:HWID_Manual
powershell.exe "C:\IT\HWID\Choices\HWID_Manual.ps1"
exit
echo: "File has been outputted to C:\IT\AutopilotHWID.csv"
goto :main

REM Send HWID through UFILE (MANUAL)
:Upload_HWID
powershell.exe "C:\IT\HWID\Choices\Upload_HWID.ps1"
exit
goto :main

REM AutoPilot Script
:AP_Script
powershell.exe "C:\IT\HWID\Choices\AP_Install.ps1"
exit
goto :main

REM Teamviewer Silent Install
:Teamviewer_Install
powershell.exe "C:\IT\HWID\Choices\Teamviewer_Install.ps1"
exit
goto :main

REM Open Teamviewer
:Teamviewer_Open
powershell.exe "C:\IT\HWID\Choices\Open_Teamviewer.ps1"
exit
goto :main

