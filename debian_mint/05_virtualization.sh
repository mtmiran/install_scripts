#!/bin/bash


virt=(qemu qemu-kvm qemu-system qemu-utils libvirt-daemon-system libvirt-bin libvirt-clients libvirt-daemon-system bridge-utils
    libguestfs-tools virtinst libosinfo-bin virt-manager)

# execute
for program in ${virt[@]}; do
  if ! dpkg -l | grep -q $program; then
    sudo apt install -y "$program"
  else
    echo "[INSTALED] - $program"
  fi
done

# enable
export LIBVIRT_DEFAULT_URI='qemu:///system'
sudo virsh net-autostart default
sudo adduser $USER libkirt
sudo adduser $USER libvirt-qemu
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
