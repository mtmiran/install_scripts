#!/bin/bash

sudo apt-get install pipewire
sudo apt-get remove pulseaudio
sudo apt-get install pipewire-audio-client-libraries pipewire-pulse
sudo systemctl enable --now pipewire

