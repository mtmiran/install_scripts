#/bin/bash

# UPDATE
sudo dpkg --configure -a
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y

# UI

# i3
i3=(i3)

# cinnamon
cinnamon=(cinnamon-desktop-environment)

# xfce
xfce=(xfce4 xfce4-goodies)

# PROGRAMS

# files
files=(thunar ranger)

# network
network=(network-manager firefox-esr qbittorrent brave-browser signal-desktop)

# screen
sreen=(arandr obs-studio xfce4-screenshooter)

# audio
audio=(alsa-utils pulseaudio pavucontrol ffmpeg audacity xbindkeys pipewire bluez-* pulseaudio-module-bluetooth blueman)

# video
video=(mpv kdenlive peek)

# image
image=(feh gimp)

# micellanious
micellanious=(lightdm rofi btop bash-completion tree unrar-free p7zip-full mencoder libavcodec-extra clamav clamav-freshclam gdebi gparted synaptic rsync rclone figlet ufw stacer tlp tlp-rdw)

# programming
programming=(tmux git xterm python3-pip python3-dev pycodestyle pyflakes pylint codium)

# academic programms
academic=(pdfarranger calibre texlive-full texlive-lang-portuguese texlive-science texlive-fonts-recommended texlive-latex-extra texlive-publishers latexmk texmaker libreoffice okular pandoc libghc-citeproc-dev)

# themes
themes=(lxappearance papirus-icon-theme)

# EXECUTION

install=(
	#"${i3[@]}"
	"${xfce[@]}"
	# "${cinnamon[@]}"
	# "${files[@]}"
	"${network[@]}"
	"${sreen[@]}"
	"${audio[@]}"
	"${video[@]}"
	"${image[@]}"
	"${micellanious[@]}"
	"${programming[@]}"
	"${academic[@]}"
	# "${themes[@]}"
)

for program in ${install[@]}; do
	if ! dpkg -l | grep -q $program; then
		sudo apt install -y "$program"
	else
		echo "[INSTALED] - $program"
	fi
done

#### FILES ####
# mkdir /home/$USER/Documentos
# mkdir /home/$USE/Imagens
# mkdir /home/$USE/Downloads
# mkdir /home/$USE/Musicas
# mkdir /home/$USE/Videos

#### ENABLE STUFFS ####
enable firewall
sudo ufw enable
sudo systemctl enable tlp

### Virtualization ###
sudo systemctl status libvirtd.service
sudo systemctl enable --now libvirtd
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER

#### Youtube-dlp ####
python3 -m pip install -U yt-dlp

##### POS-INSTALL #####

sudo dpkg --configure -a
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y
