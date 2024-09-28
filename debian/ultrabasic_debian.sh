#!/bin/bash

# https://github.com/linuxnomas/linux_scripts/blob/main/debian-i3.sh

echo ++++++++++++++++++++
echo + Install packages +
echo ++++++++++++++++++++
sudo apt install i3 lightdm x11-xserver-utils -y
sudo apt install fonts-font-awesome curl feh gimp -y
sudo apt install git tmux vim -y

echo +++++++++++++++++++++++++++
echo + Install Thorium browser +
echo +++++++++++++++++++++++++++
wget https://dl.thorium.rocks/debian/dists/stable/thorium.list
sudo mv thorium.list /etc/apt/sources.list.d/
sudo apt update -y
sudo apt install thorium-browser -y
