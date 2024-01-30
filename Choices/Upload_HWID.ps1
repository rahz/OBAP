$Site = "www.ufile.io"
$Test = Invoke-WebRequest -URI $Site
$Test.Links | Foreach {$_.href }
exit
goto :main