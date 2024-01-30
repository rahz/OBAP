$url = "https://download.teamviewer.com/download/TeamViewer_Host_Setup_x64.exe"
$outpath = "C:/IT/Teamviewer_Host.exe"
Invoke-WebRequest -Uri $url -OutFile $outpath
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $outpath)
$args = @("/S","/norestart")
Start-Process -Filepath "C:/IT/Teamviewer_Host.exe" -ArgumentList $args
exit
goto :main