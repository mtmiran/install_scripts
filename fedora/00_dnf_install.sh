#/bin/bash


# RPMFusion ------------------------------------------------------------------------------------------------------
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# UPDATE ----------------------------------------------------------------------------------------------------------
sudo dnf update -y

# UI --------------------------------------------------------------------------------------------------------------

# i3
i3=(i3)

# PROGRAMS --------------------------------------------------------------------------------------------------------

# network
network=(firefox qbittorrent)

# audio
audio=(alsa-utils ffmpeg audacity xbindkeys pipewire)

# video
video=(xrandr mpv kdenlive obs-studio peek gstreamer1-plugins-good-extras gstreamer1-plugins-bad-freeworld)

# image
image=(feh gimp)

#programming
programming=(tmux git xterm neovim python3-pip python3-dev npm)

# micellanious
micellanious=(syncthing fzf rofi btop bash-completion tree unrar-free p7zip-full mencoder libavcodec-extra clamav clamav-freshclam gparted rsync rclone figlet ufw tlp tlp-rdw)

# academic programms
academic=(pdfarranger calibre texlive-scheme-full texlive-chktex LaTeXML okular pandoc libghc-citeproc-dev fontawesome-fonts google-roboto-fonts)

# themes
themes=(lxappearance)

# EXECUTION -------------------------------------------------------------------------------------------------------

install=(
	#"${i3[@]}"
	"${files[@]}"
	"${network[@]}"
	"${audio[@]}"
	"${video[@]}"
	"${image[@]}"
	"${programming[@]}"
	"${micellanious[@]}"
	"${academic[@]}"
	#"${themes[@]}"
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

# Brave ------------------------------------------------------------------------------------------------------------
curl -fsS https://dl.brave.com/install.sh | sh

# Gamming and Codecs
sudo dnf install mesa-va-drivers-freeworld -y
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf install steam gamemode mangohud -y

# ENABLE STUFFS ----------------------------------------------------------------------------------------------------
enable firewall
sudo ufw enable
sudo systemctl enable tlp
systemctl --user enable syncthing.service
systemctl --user start syncthing.service


