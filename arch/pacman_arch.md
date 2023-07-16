# Configuração e instalçao de programas em distro Base Deb

## 1 - Prepara ambiente

### Teclado ABNT2

`sudo setxkbmap -model abnt2 -layout br -variant abnt2`

xmodmap -pke > ~/.Xmodmap

no bashrc

if [[ -f $HOME/.Xmodmap ]]; then
    xmodmap "$HOME/.Xmodmap"
fi

## ou

`sudo nano /etc/X11/xorg.conf.d/10-evdev.conf`

Section "InputClass"
        Identifier "keyboard default"
        MatchIsKeyboard "yes"
        Option   "XkbLayout" "br"
        Option   "XkbVariant" "abnt2" 
EndSection

### User Root

`sudo passwd root`

### Updates

`sudo vi /etc/pacman.conf`

Descomentar [mutilib]

`sudo pacman -Syy`

#### DNS

- [Configure DNS NameServer on Linux Cloud Servers](https://www.layerstack.com/resources/tutorials/Configuring-DNS-NameServer-on-Linux-Cloud-Servers)

```
$ sudo pacman -S resolvconf
```

- setup DNS nameservers
```
# vi /etc/resolvconf/resolv.conf

#### CloudFlare ####
nameserver 1.1.1.1
nameserver 1.0.0.1

#### Google ####
nameserver 8.8.8.8
nameserver 8.8.4.4

:wq

sudo /etc/init.d/networking restart

### ou 

sudo systemctl restart resolvconf.service

### reboot 

```

### AUR

 
sudo pacman -S --needed base-devel git && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si

### Drivers

- descobrir placa
` lspci -k | grep -A 2 -E "(VGA|3D)"`
- [tutorial](https://howto.lintel.in/install-nvidia-arch-linux/)

```
sudo pacman -S linux-headers

### nvidia ###
sudo pacman -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
### intel ###
sudo pacman -S --needed lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader


### Optimus
## atualizar yay
yay -Syu
yay -S base-devel
yay -S optimus-manager optimus-manager-qt
sudo systemctl enable optimus-manager

### checar nvidia ###
nvidia-installer-check 
```

#### bluetooth

`sudo pacman -S bluez bluez-utils blueman`

- verificar se autoenable está desconectado

`lsmod | grep btusb`
`sudo vim /etc/bluetooth/main.conf`

- habilitar: descomentar *AutoEnable=true*

`sudo systemctl start bluetooth.service`

- automaticamente no start up

`sudo systemctl enable bluetooth.service`

#### audio

`sudo pacman -S pavucontrol`

## 2 - Programas

### 2.1 - Sistema

`sudo pacman -S psensor clamav  xfce4-goodies flatpak rofi bash-completion tree mencoder gparted  rsync rclone figlet ufw`

#### úteis

`sudo pacman -S fd exa bashtop`

### 2.2 - Internet e Browsers

`sudo pacman -S firefox qbittorrent signal-desktop`
`yay -S brave-bin`

### 2.3 - Mídias

`sudo pacman -S obs-studio ffmpeg audacity mpv kdenlive feh gimp`

### 2.4 - Programação

#### 2.4.1 - IDEs e Terminal

`sudo pacman -S neovim tmux xterm python-pip`
`yay -S vscodium-bin`

#### 2.4.2 - Data Science

### 2.5 - Academicos

`sudo pacman -S pdfarranger calibre texlive-most texlive-bin texlive-lang texmaker ttf-caladea libreoffice okular obsidian`


### 2.6 - Geoprocessamento

```
sudo pacman -S qgis
yay -S grass saga-gis
```

### 2.7 - Segurança

### 2.8 - Configurações

#### Fontes

`yay -S ttf-ms-fonts ttf-times-new-roman`

#### Nvim

- <https://www.youtube.com/watch?v=w7i4amO_zaE&t=1488s> 
- [Packer](https://github.com/wbthomason/packer.nvim)
`git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim`
- install packer
    vi .config/nvim/lua/mt/pakcer.lua 
    :so 
    :PackerSync

#### tmux

`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
`sudo pacman -S  xsel`

## 3 - Flatpaks

sudo pacman -S flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

`flatpak install flathub org.jabref.jabref`

## 4 - Virtualização

- [tutorial - kvm](https://linuxhint.com/install_configure_kvm_archlinux/)
```
sudo pacman -Syy
sudo pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat

sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service

### configurar
sudo vi /etc/libvirt/libvirtd.conf
# unix_sock_group = "libvirt"
# unix_sock_rw_perms = "0770"

sudo usermod -a -G libvirt $(whoami)
newgrp libvirt
```

## 5 - Jogos

- [tutorial](https://www.youtube.com/watch?v=rH-IiKxoozw&list=WL&index=91)
- windows font: `sudo pacman -S ttf-font`

### Proton

`yay -S proton`

- [ProtonGE](https://github.com/GloriousEggroll/proton-ge-custom)
    - `yay -S proton-ge-custom-bin`

### Dxvk

`yay -S dxvk-bin`

### Steam

- instalação
```
sudo pacman -S lib32-alsa-plugins mesa mesa-libgl
sudo pacman -S steam
```
- abrir steam depois de instalar

- habilitar proton: abrir - Steam / Steam Play / Advanced, and ticking the Enable Steam Play for all other titles

### Wine

`sudo pacman -S wine-staging wine-gecko wine-mono gamemode`



### Lutris

`sudo pacman -S lutris`
- erro 256 <https://www.youtube.com/watch?v=64HGUGxNKS0>

### Extras

- gamemode - Steam
    - gamemodrun %command% -novid -nojoy
- genshin impact pede o xdelta3
'sudo apt-get install -y xdelta3'

## 6 - Geoprocessamento
```
sudo pacman -S fcgi gpsbabel gsl python-gdal python-jinja python-owslib
python-psycopg2 python-pygments python-numpy python-yaml
sudo pacman -S qgis
yay -S grass saga-gis
```
## 7 - Configuração e Fontes




