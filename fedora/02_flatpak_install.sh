#!/usr/bin/env bash

# discord
# flatpak install flathub com.discordapp.Discord

# skype
# flatpak install flathub com.skype.Client

# onlyoffice
# flatpak install -y flathub org.onlyoffice.desktopeditors

# Obsidian
flatpak install -y flathub md.obsidian.Obsidian

# Jabref
flatpak install -y flathub org.jabref.jabref
flatpak override --user --filesystem=host org.jabref.jabref

# gnome extentions
# flatpak install -y flathub com.mattjakeman.ExtensionManager

# Brave
flatpak install -y flathub com.brave.Browser

# Vscodium
flatpak install -y flathub com.vscodium.codium

# signal
flatpak install -y flathub org.signal.Signal

# Stremio
flatpak install -y flathub com.stremio.Stremio

# Steam
flatpak install -y flathub com.valvesoftware.Steam  

flatpak override --user com.valvesoftware.Steam --filesystem=host

# list applications: flatpak list
# uninstall: flatpak uninstall [programa]
# search program: flatpak search [program]
# run application: flatpak run [program]
