#!/bin/bash
sudo apt purge snapd -y
sudo wget https://github.com/SteavenGamerYT/SteavenBuntu/raw/main/nosnap.pref -P /etc/apt/preferences.d/nosnap.pref
sudo apt update
sudo apt upgrade -y
sudo apt install --no-install-recommends gnome -y
sudo apt install lightdm lightdm-settings -y
sudo apt install git wget -y