#!/bin/bash


### ROFI THEMES ###

git clone https://github.com/lr-tech/rofi-themes-collection.git
cd rofi-themes-collection
mv -f themes/  ~/.local/share/rofi/
cd ..
rm -rf rofi-themes-collection


#### FOR NVIM ####
## vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#### Microsoft
sudo apt install ttf-mscorefonts-installer -y


#### Nerdfonts
cd /temp/
# git clone https://github.com/ryanoasis/nerd-fonts
# cd nerd-fonts
# # install all the fonts:  sudo ./install.sh
# # or:  sudo ./install.sh <Font-Name>
# sudo ./install.sh Hack
# sudo ./install.sh HeavyData
# sudo ./install.sh RobotoMono
# download one by one
# RobotoMono
echo "[-] Download fonts RobotoMono [-]"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip
unzip RobotoMono.zip -d ~/.fonts
fc-cache -fv
echo "done!"
# HeavyData
echo "[-] Download fonts [HeavyData] [-]"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/HeavyData.zip
unzip HeavyData.zip -d ~/.fonts
fc-cache -fv
echo "done!"
# Hack
echo "[-] Download fonts Hack [-]"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip Hack.zip -d ~/.fonts
fc-cache -fv
echo "done!"
# Hack
echo "[-] Download fonts JetBrainsMono [-]"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.fonts
fc-cache -fv
echo "done!"
cd ..
