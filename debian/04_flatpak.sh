#!/bin/bash

sudo apt install flatpak &&

# flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &&

# discord
# flatpak install flathub com.discordapp.Discord

# skype
# flatpak install flathub com.skype.Client

# onlyofice
flatpak install flathub org.onlyoffice.desktopeditors

# OBS
# flatpak install flathub com.obsproject.Studio

# kdenlive
# flatpak install flathub org.kde.kdenlive

# Obsidian
# flatpak install flathub md.obsidian.Obsidian

# Jabref
# flatpak install flathub org.jabref.jabref

# Zoom
# flatpak install flathub us.zoom.Zoom

# Stremio
# flatpak install flathub com.stremio.Stremio

# list applications: flatpak list
# uninstall: flatpak uninstall [programa]
# search program: flatpak search [program]
# run application: flatpak run [program]
