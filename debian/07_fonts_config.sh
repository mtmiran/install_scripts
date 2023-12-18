#!/bin/bash

# ROFI THEMES ------------------------------------------------------------------------------------------------------
git clone https://github.com/lr-tech/rofi-themes-collection.git
cd rofi-themes-collection
mv -f themes/ ~/.local/share/rofi/
cd ..
rm -rf rofi-themes-collection

# FOR TMUX ---------------------------------------------------------------------------------------------------------
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo apt install xsel

# Microsoft --------------------------------------------------------------------------------------------------------
sudo apt install ttf-mscorefonts-installer -y

#### Nerdfonts
cd /temp/
# git clone https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
# install all the fonts:  sudo ./install.sh
# or:  sudo ./install.sh <Font-Name>
sudo ./install.sh Hack
sudo ./install.sh HeavyData
sudo ./install.sh RobotoMono

