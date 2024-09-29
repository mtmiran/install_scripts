#!/bin/bash

sudo dnf install flatpak &&

# flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &&

# discord
flatpak install flathub com.discordapp.Discord

# skype
# flatpak install flathub com.skype.Client

# onlyoffice
flatpak install flathub org.onlyoffice.desktopeditors

# Obsidian
flatpak install flathub md.obsidian.Obsidian

# Jabref
flatpak install flathub org.jabref.jabref
flatpak override --user --filesystem=host org.jabref.jabref

# gnome extentions
flatpak install flathub com.mattjakeman.ExtensionManager

# signal
flatpak install flathub org.signal.Signal

# Stremio
flatpak install flathub com.stremio.Stremio

# list applications: flatpak list
# uninstall: flatpak uninstall [programa]
# search program: flatpak search [program]
# run application: flatpak run [program]
