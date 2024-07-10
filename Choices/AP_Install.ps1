Set-ExecutionPolicy Bypass
Install-Script -Name Get-WindowsAutoPilotInfo
Get-WindowsAutoPilotInfo -Online -GroupTag AADUserDriven
echo "Please Sign-In with Global Administrator Credentials..."
