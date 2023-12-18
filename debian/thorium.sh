#!/bin/bash

wget https://dl.thorium.rocks/debian/dists/stable/thorium.list
sudo mv thorium.list /etc/apt/sources.list.d/
sudo apt update -y
sudo apt install thorium-browser -y
