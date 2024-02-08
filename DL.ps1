[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

Invoke-WebRequest -Uri https://raw.githubusercontent.com/rahz/OBAP/main/HWID.ps1 -OutFile C:\IT\HWID.ps1
