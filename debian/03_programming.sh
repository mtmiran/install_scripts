#!/bin/bash

# VSCodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
    
    
# programming
programming=(tmux git xterm vim codium python3-pip python3-dev)

for program in ${programming[@]}; do
	if ! dpkg -l | grep -q $program; then
		sudo apt install -y "$program"
	    echo "[DONE INSTALL] - $program"
	else
		echo "[INSTALED] - $program"
	fi
done

# miniconda
# -----------------------------------------------------------------------------------------------------
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
conda config --set auto_activate_base false

