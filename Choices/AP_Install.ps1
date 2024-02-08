Set-ExecutionPolicy Bypass
Install-Script -Name Get-WindowsAutoPilotInfo
echo Y
echo Y
echo A
Get-WindowsAutoPilotInfo -Online -GroupTag AADUserDriven
