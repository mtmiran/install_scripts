#!/bin/bash

# BEFORE -----------------------------------------------------------------------------------------------------------

#sudo passwd root

sudo dpkg --add-architecture i386
sudo apt -y install linux-headers-$(uname -r) build-essential

# updates

sudo dpkg --configure -a
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y



# BASIC ------------------------------------------------------------------------------------------------------------

basic=(x11-xserver-utils xorg acpi lm-sensors build-essential apt-transport-https curl git wget)

sudo dpkg --add-architecture i386


# EXECUTION --------------------------------------------------------------------------------------------------------

for program in ${basic[@]}; do
  if ! dpkg -l | grep -q $program; then
    sudo apt install -y "$program"
  else
    echo "[INSTALED] - $program"
  fi
done

# IF UBUNTU --------------------------------------------------------------------------------------------------------
# Ubuntu error report
# sudo apt purge --autoremove apport

# IF DEBIAN --------------------------------------------------------------------------------------------------------

# Prepre nvidia debian 
# noveau
#sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
#sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
#sudo update-initramfs -u

#systemctl reboot
