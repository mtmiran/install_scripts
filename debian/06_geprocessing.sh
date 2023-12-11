#!/bin/bash

### QGIS ###

sudo apt install gnupg software-properties-commo

wget -qO - https://qgis.org/downloads/qgis-archive-keyring.gpg | sudo gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/qgis-archive.gpg --import
sudo chmod a+r /etc/apt/trusted.gpg.d/qgis-archive.gpg

## ubuntu
# sudo add-apt-repository "deb https://qgis.org/ubuntu $(lsb_release -c -s) main"
## debian
sudo add-apt-repository "deb https://qgis.org/debian $(lsb_release -c -s) main"

sudo apt update

sudo apt install qgis qgis-plugin-grass saga

## Google Earth
sudo apt install google-earth-pro-stable
