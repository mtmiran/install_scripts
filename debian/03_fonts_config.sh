#!/bin/bash

#### Neovim extras #### 
# lint and formating
sudo apt install shellcheck shfmt # bash
pip3 install black flake8 # pyhton

# markdown - html - javascript
sudo apt install nodejs
sudo apt install npm
sudo npm install -g prettier markdownlint eslint 

# lua
npx @johnnymorganz/stylua-bin --help

### ROFI THEMES ###

git clone https://github.com/lr-tech/rofi-themes-collection.git
cd rofi-themes-collection
mv -f themes/  ~/.local/share/rofi/
cd ..
rm -rf rofi-themes-collection


#### FOR TMUX ####
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo apt install xsel


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
