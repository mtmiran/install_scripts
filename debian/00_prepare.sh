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
basic=(x11-xserver-utils xorg acpi lm-sensors build-essential apt-transport-https curl git)

sudo dpkg --add-architecture i386

# EXECUTION

for program in ${basic[@]}; do
  if ! dpkg -l | grep -q $program; then
    sudo apt install -y "$program"
  else
    echo "[INSTALED] - $program"
  fi
done


# VSCodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list

# Signal

wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee -a /etc/apt/sources.list.d/signal-xenial.list


# Neovim Ubuntu-Mint
# sudo add-apt-repository ppa:neovim-ppa/stable

# Ubuntu error report
# sudo apt purge --autoremove apport

### Prepre nvidia debian ###

sudo apt -y install linux-headers-$(uname -r) build-essential

# noveau
sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"


sudo update-initramfs -u

# systemctl reboot
