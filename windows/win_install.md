# Windows Install

## 1 - Chocolatey

### Install

 `Set-ExecutionPolicy AllSigned`

`Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))`

`choco feature enable -n allowGlobalConfirmation`

### chocolatey.org/packages

choco install mpv firefox brave 7zip malwarebytes googledrive -y 
choco install foxitereader libreoffice-fresh onlyoffice -y
choco install virtualbox -y
choco install gimp inkscape audacuty kdenlive obs-studio -y 
choco install dotnet3.5 -y
choco install git python vscode notepadplusplus -y

### Update

choco update all -y

### Uninstall

choco uninstall [package] -y