#CHANGE .EXE TO THE PROGRAM_FILES FOR teamviewer.EXE - REMOVE ARGS 

Start-Process -Filepath "C:/IT/Teamviewer_Host.exe" -ArgumentList $args
