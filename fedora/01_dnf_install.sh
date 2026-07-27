#!/usr/bin/env bash

set -euo pipefail

# UPDATE ----------------------------------------------------------------------------------------------------------
echo "[INFO] Atualizando o sistema..."
sudo dnf update --refresh -y

# CATEGORIAS DE PACOTES -------------------------------------------------------------------------------------------

i3=(
    i3
)

network=(
    firefox 
    qbittorrent
)

screen=(
    arandr 
    xfce4-screenshooter
)

audio_video=(
    alsa-utils 
    ffmpeg 
    audacity 
    xbindkeys 
    pipewire 
    vlc 
    kdenlive 
    obs-studio 
    peek 
    gstreamer1-plugins-good-extras 
    gstreamer1-plugins-bad-freeworld 
    gstreamer1-plugins-ugly 
    mesa-va-drivers-freeworld 
    mesa-vdpau-drivers-freeworld
    yt-dlp  
)

image=(
    feh 
    gimp
)

programming=(
    tmux 
    git 
    neovim 
    make 
    automake 
    gcc 
    gcc-c++ 
    kernel-devel 
    cmake 
    wget 
    perl 
    unzip 
    gnupg 
    fastfetch 
    unrar 
    python3-devel  
    python3-pip 
    nodejs 
    npm 
    java-latest-openjdk-devel
)

fonts=(
    fira-code-fonts 
    jetbrains-mono-fonts 
    liberation-fonts 
    google-noto-sans-fonts 
    google-noto-emoji-color-fonts 
    google-roboto-fonts 
    cascadia-fonts-all
    fontawesome-fonts
)

miscellaneous=(
    syncthing 
    fzf 
    rofi 
    btop 
    bash-completion 
    tree 
    p7zip 
    p7zip-plugins   
    clamav 
    clamav-update   
    gparted 
    rsync 
    rclone 
    figlet 
    firewalld  
    pv
)

academic=(
    pdfarranger 
    calibre 
    texlive-scheme-full 
    texlive-chktex 
    LaTeXML 
    okular 
    pandoc
)

jogos=(
    steam 
    gamemode 
    mangohud        
    wine 
    wine-mono 
    wine-gecko 
    winetricks 
    protontricks 
    vulkan-tools 
    goverlay 
    dnf-plugins-core
)

# EXECUÇÃO -------------------------------------------------------------------------------------------------------

install=(
    "${i3[@]}"
    "${network[@]}"
    "${screen[@]}"
    "${audio_video[@]}"
    "${image[@]}"
    "${programming[@]}"
    "${fonts[@]}"
    "${miscellaneous[@]}"
    "${academic[@]}"
    "${jogos[@]}"
)

echo "[INFO] Instalando pacotes no Fedora..."

sudo dnf install -y "${install[@]}"

# HABILITAR E CONFIGURAR SERVIÇOS ----------------------------------------------------------------------------------

echo "[INFO] Habilitando serviços..."
sudo systemctl enable --now firewalld
systemctl --user enable --now syncthing.service
sudo systemctl enable --now gamemoded.service

echo "[SUCESSO] Configuração concluída!"
