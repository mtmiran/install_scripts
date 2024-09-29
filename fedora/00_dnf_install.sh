#/bin/bash

# UPDATE ----------------------------------------------------------------------------------------------------------
sudo dnf update -y

# UI --------------------------------------------------------------------------------------------------------------

# i3
i3=(i3)

# PROGRAMS --------------------------------------------------------------------------------------------------------

# files
files=(ranger)

# network
network=(firefox qbittorrent)

# screen
sreen=(arandr obs-studio xfce4-screenshooter)

# audio
audio=(alsa-utils ffmpeg audacity xbindkeys pipewire)

# video
video=(mpv kdenlive peek)

# image
image=(feh gimp)

#programming
programming=(tmux git xterm neovim python3-pip python3-dev)

# micellanious
micellanious=(syncthing fzf rofi btop bash-completion tree unrar-free p7zip-full mencoder libavcodec-extra clamav clamav-freshclam gparted rsync rclone figlet ufw stacer tlp tlp-rdw)

# academic programms
academic=(pdfarranger calibre texlive-scheme-full texlive-chktex LaTeXML okular pandoc libghc-citeproc-dev)

# gamming
gamming=(steam mangohud gamemode)

# EXECUTION -------------------------------------------------------------------------------------------------------

install=(
	#"${i3[@]}"
	"${files[@]}"
	"${network[@]}"
	"${sreen[@]}"
	"${audio[@]}"
	"${video[@]}"
	"${image[@]}"
	"${programming[@]}"
	"${micellanious[@]}"
	"${academic[@]}"
	#"${gamming[@]}"
)

for program in "${install[@]}"; do
    if ! rpm -q "$program"; then
        sudo dnf install -y "$program"
        echo "[DONE] - $program"
    else
        echo "[INSTALLED] - $program"
    fi
done

# Youtube-dlp ------------------------------------------------------------------------------------------------------
python3 -m pip install -U yt-dlp


# ENABLE STUFFS ----------------------------------------------------------------------------------------------------
enable firewall
sudo ufw enable
sudo systemctl enable tlp
systemctl --user enable syncthing.service
systemctl --user start syncthing.service


