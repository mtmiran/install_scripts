#!/bin/bash

# <https://wiki.winehq.org/Download>


# Update the package repository and install dependencies -----------------------------------------------------------
sudo apt update
sudo apt install -y software-properties-common

# Add the WineHQ repository ----------------------------------------------------------------------------------------

# if debian
# Get the value of VERSION_CODENAME from /etc/os-release
#DEBIAN_VERSION=$(grep VERSION_CODENAME /etc/os-release | cut -d'=' -f2)
#sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/debian/ '$DEBIAN_VERSION' main'

# if mint


# Add the WineHQ GPG key
wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -

# Install Wine Staging
sudo apt update
sudo apt install -y --install-recommends winehq-staging
sudo apt install -y winetricks mono-devel

WINEPREFIX=$HOME/prefix_wine winecfg
sudo winetricks --self-update
WINEPREFIX=$HOME/prefix_wine winetricks dxvk

echo "Wine-staging and dependencies have been installed successfully."
