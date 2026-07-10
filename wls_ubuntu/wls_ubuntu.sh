#/bin/bash

# UPDATE
sudo dpkg --configure -a
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y

# Neovim Ubuntu-Mint
# sudo add-apt-repository ppa:neovim-ppa/stable

# micellanious
micellanious=(htop bash-completion tree unrar-free p7zip-full clamav clamav-freshclam rsync rclone figlet ranger curl wget)


# programming
programming=(tmux git python3-pip python3-dev pycodestyle pyflakes pylint neovim)

# EXECUTION

install=(
      "${micellanious[@]}"
      "${programming[@]}"
       )

for program in ${install[@]}; do
    sudo apt install -y "$program"
done

#### Youtube-dlp ####
# python3 -m pip install -U yt-dlp


# PYTHON
python3 -m pip install autopep8 flake8 pyflakes isort yapf numpy pandas matplotlib ipython jedi pynvim

##### POS-INSTALL #####

sudo dpkg --configure -a
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y
