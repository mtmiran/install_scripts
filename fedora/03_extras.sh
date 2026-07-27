#!/usr/bin/env bash

# for tmux ---------------------------------------------------------------------------------------------------------------------------
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo dnf install -y xclip xsel

# for neovim -------------------------------------------------------------------------------------------------------------------------
pip3 install -y pynvim pyright
sudo dnf install -y ShellCheck

# for quick notes --------------------------------------------------------------------------------------------------------------------
sudo dnf install -y python3-tkinter

# auto-cpufreq -----------------------------------------------------------------------------------------------------------------------
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer
