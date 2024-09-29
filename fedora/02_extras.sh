#!/bin/bash

# VSCodium ---------------------------------------------------------------------------------------------------------------------------
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg

printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo

sudo dnf install codium

# for tmux ---------------------------------------------------------------------------------------------------------------------------
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo dnf install xclip xsel

# for neovim -------------------------------------------------------------------------------------------------------------------------
pip3 install pynvim pyright
sudo dnf install ShellCheck
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install texlab marksman


# appimage launcher-------------------------------------------------
wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm
sudo dnf install appimage* -y

# bitwarden --------------------------------------------------------------------------------------------------------------------------
mkdir -p ~/AppImage && \
wget -O ~/AppImage/Bitwarden-AppImage 'https://vault.bitwarden.com/download/?app=desktop&platform=linux&variant=appimage' && \

chmod +x ~/AppImage/Bitwarden-AppImage && \

# ~/AppImage/Bitwarden-AppImage

# zoom --------------------------------------------------------------------
wget https://zoom.us/client/6.1.6.1013/zoom_x86_64.rpm
sudo dnf install zoom*

# brave-browser ----------------------------------------------------------------------------------------------------------------------
sudo dnf install dnf-plugins-core

sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

sudo dnf install brave-browser

# for quick notes ---------------------------------------------------------
sudo dnf install python3-tkinter

