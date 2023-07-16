# Nvidia

sudo apt -y install linux-headers-$(uname -r) build-essential

sudo dpkg --add-architecture i386

sudo apt -y install nvidia-driver nvidia-kernel-dkms nvidia-xconfig nvidia-settings nvidia-cuda-toolkit libavcodec-extra firmware-linux-nonfree nvidia-smi nvidia-xconfig

sudo apt install bumblebee-nvidia primus-nvidia primus-vk-nvidia

sudo adduser $USER bumblebee

sudo systemctl restart bumblebeed

# ubuntu nvidia

# descobrir driver nvidia: ubuntu-drivers devices
# sudo add-apt-repository ppa:graphics-drivers/ppa && sudo dpkg --add-architecture i386 && sudo apt update && sudo apt install -y nvidia-driver-525 libvulkan1 libvulkan1:i386

