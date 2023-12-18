#/bin/bash

# UPDATE ----------------------------------------------------------------------------------------------------------
sudo dpkg --configure -a
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y

# UI --------------------------------------------------------------------------------------------------------------

# i3
i3=(i3)

# xfce
xfce=(xfce4 xfce4-goodies)

# PROGRAMS --------------------------------------------------------------------------------------------------------

# files
files=(ranger)

# network
network=(network-manager firefox qbittorrent )

# screen
sreen=(arandr obs-studio xfce4-screenshooter)

# audio
audio=(alsa-utils ffmpeg audacity xbindkeys pipewire bluez-* blueman)

# video
video=(mpv kdenlive peek)

# image
image=(feh gimp)

# micellanious
micellanious=(rofi btop bash-completion tree unrar-free p7zip-full mencoder libavcodec-extra clamav clamav-freshclam gdebi gparted rsync rclone figlet ufw stacer tlp tlp-rdw)

# academic programms
academic=(pdfarranger calibre texlive-full texlive-lang-portuguese texlive-science texlive-fonts-recommended texlive-latex-extra okular pandoc libghc-citeproc-dev)

# themes
themes=(lxappearance)

# EXECUTION -------------------------------------------------------------------------------------------------------

install=(
	"${i3[@]}"
	#"${xfce[@]}"
	# "${files[@]}"
	"${network[@]}"
	"${sreen[@]}"
	"${audio[@]}"
	"${video[@]}"
	"${image[@]}"
	"${micellanious[@]}"
	"${academic[@]}"
	# "${themes[@]}"
)

for program in ${install[@]}; do
	if ! dpkg -l | grep -q $program; then
		sudo apt install -y "$program"
		echo "[DONE] - $program"
	else
		echo "[INSTALED] - $program"
	fi
done

# Youtube-dlp ------------------------------------------------------------------------------------------------------
python3 -m pip install -U yt-dlp


# ENABLE STUFFS ----------------------------------------------------------------------------------------------------
enable firewall
sudo ufw enable
sudo systemctl enable tlp



# POS-INSTALL ------------------------------------------------------------------------------------------------------

sudo dpkg --configure -a
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y
