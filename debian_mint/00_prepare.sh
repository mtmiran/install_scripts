#!/bin/bash

# PREPARE

#sudo passwd root


# UPDATE
sudo dpkg --configure -a
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y

# BASIC
basic=(x11-xserver-utils xorg acpi lm-sensors build-essential apt-transport-https curl)

sudo dpkg --add-architecture i386

# EXECUTION

install=("${basic[@]}")

for program in ${install[@]}; do
  if ! dpkg -l | grep -q $program; then
    sudo apt install -y "$program"
  else
    echo "[INSTALED] - $program"
  fi
done

# Brave

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# VSCodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list

# Neovim Ubuntu-Mint
# sudo add-apt-repository ppa:neovim-ppa/stable

## UBUNTU ##
# # stop snapd services
# sudo systemctl stop snapd && sudo systemctl disable snapd
# # purge snapd
# sudo apt autoremove --purge snapd gnome-software-plugin-snap
# # remove no longer needed folders
# rm -rf ~/snap
# sudo rm -rf /snap /var/snap /var/lib/snapd /var/cache/snapd /usr/lib/snapd
