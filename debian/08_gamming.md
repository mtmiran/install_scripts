#!/bin/bash


# dotnet40
# env WINEPREFIX=$HOME/winedotnet wineboot --init && env WINEPREFIX=$HOME/winedotnet winetricks --force dotnet40 corefonts

# drivers vulkan
sudo add-apt-repository ppa:graphics-drivers/ppa

## Instalação do Lutris:
sudo add-apt-repository ppa:lutris-team/lutris

sudo apt update
sudo apt upgrade -y

## ProtonGE

<https://github.com/GloriousEggroll/proton-ge-custom#installation>

## Instalação do Wine:
# instalar versão staging

<https://wiki.winehq.org/Download>



sudo apt update

sudo apt install -y libvulkan1 libvulkan-dev dxvk lutris gamemode


## Commands

- Gamemode only: gamemoderun %command% -novid -high
- Gamemode + Mangohud: gamemoderun mangohud MANGOHUD_CONFIG=position=middle-left %command% -novid -high
