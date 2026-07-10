#!/bin/bash

sudo dnf install flatpak &&

# flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &&

# discord
# flatpak install -y flathub com.discordapp.Discord

# skype
# flatpak install -y flathub com.skype.Client

# onlyoffice
# flatpak install -y flathub org.onlyoffice.desktopeditors

# Obsidian
flatpak install -y flathub md.obsidian.Obsidian

# Jabref
flatpak install -y flathub org.jabref.jabref
flatpak override --user --filesystem=host org.jabref.jabref

# gnome extentions
flatpak install -y flathub com.mattjakeman.ExtensionManager

# signal
flatpak install -y flathub org.signal.Signal

# Stremio
flatpak install -y flathub com.stremio.Stremio

# Pika Backup
flatpak install -y flathub org.gnome.World.PikaBackup

# Bitwarden
flatpak install -y flathub com.bitwarden.desktop

# list applications: flatpak list
# uninstall: flatpak uninstall [programa]
# search program: flatpak search [program]
# run application: flatpak run [program]
