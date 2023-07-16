#!/bin/bash

# https://www.cyberciti.biz/faq/install-kvm-server-debian-linux-9-headless-server/
# em vez de : sudo systemctl restart network-manager
# $ sudo systemctl restart systemd-networkd
# https://linuxhint.com/install_configure_kvm_archlinux/

virt=(qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils libguestfs-tools genisoimage virtinst libosinfo-bin)

# execute
for program in ${virt[@]}; do
	sudo apt install -y "$program"
done

# enable
sudo adduser vivek libvirt
sudo adduser vivek libvirt-qemu
sudo systemctl start libvirtd.service
sudo systemctl enable libvirtd.service
sudo usermod -a -G libvirt $(whoami)
newgrp libvirt
sudo systemctl restart libvirtd.service
