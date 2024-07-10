Set-ExecutionPolicy Bypass
Install-Script -Name Get-WindowsAutoPilotInfo
echo "Please Sign-In with Global Administrator Credentials..."
Get-WindowsAutoPilotInfo -Online -GroupTag AADUserDriven
