#!/bin/bash


# dotnet40
# env WINEPREFIX=$HOME/winedotnet wineboot --init && env WINEPREFIX=$HOME/winedotnet winetricks --force dotnet40 corefonts

# drivers vulkan

sudo apt install libvulkan1 mesa-vulkan-drivers mesa-vulkan-drivers:i386


## Steam

```
sudo apt install software-properties-common apt-transport-https dirmngr ca-certificates curl -y
sudo dpkg --add-architecture i386
sudo apt install steam-installer steam-devices -y
~/.steam/debian-installation/steam.sh
```

## Lutris

sudo apt update

sudo apt install -y libvulkan1 libvulkan-dev lutris gamemode

## ProtonGE

<https://github.com/GloriousEggroll/proton-ge-custom#installation>
```bash
cd /tmp/
wget https://github.com/GloriousEggroll/proton-ge-custom/releases/download/GE-Proton8-25/GE-Proton8-25.tar.gz
mkdir -p ~/.steam/root/compatibilitytools.d/
tar -xf GE-ProtonVVVVVVEEEEERRRSSSSSSIIIIION.tar.gz -C ~/.steam/root/compatibilitytools.d/
```

## Commands

- Gamemode only: gamemoderun %command% -novid -high
- Gamemode + Mangohud: gamemoderun mangohud MANGOHUD_CONFIG=position=middle-left %command% -novid -high
- PROTON_LOG=1 WINEDLLOVERRIDES="RichTapWinSDKDLL.dll=d" SteamDeck=1 prime-run %command%


## Tutorials

- [MELHORAR DESEMPENHO DOS SEUS JOGOS NO LINUX, LUTRIS E HEROIC](https://www.youtube.com/watch?v=AC1wQy1ykxs)

