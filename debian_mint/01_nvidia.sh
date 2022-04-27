# Nvidia

sudo apt -y install linux-headers-$(uname -r) build-essential

sudo dpkg --add-architecture i386

sudo apt -y install nvidia-driver nvidia-kernel-dkms nvidia-xconfig nvidia-settings nvidia-cuda-toolkit libavcodec-extra firmware-linux-nonfree nvidia-smi

sudo apt -y install bumblebee-nvidia primus

sudo adduser $USER bumblebee

sudo systemctl restart bumblebeed
