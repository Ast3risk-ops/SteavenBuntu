#!/bin/bash
sudo apt purge snapd -y
sudo wget https://github.com/SteavenGamerYT/SteavenBuntu/raw/main/nosnap.pref -P /etc/apt/preferences.d/nosnap.pref
sudo wget https://github.com/SteavenGamerYT/SteavenBuntu/raw/main/nonautilus.pref -P /etc/apt/preferences.d/nonautilus.pref
sudo wget https://github.com/SteavenGamerYT/SteavenBuntu/raw/main/nolibreoffice.pref -P /etc/apt/preferences.d/nolibreoffice.pref
sudo wget https://github.com/SteavenGamerYT/SteavenBuntu/raw/main/nogdm.pref -P /etc/apt/preferences.d/nogdm.pref
sudo wget https://github.com/SteavenGamerYT/SteavenBuntu/raw/main/01-network-manager-all.yaml -P /etc/netplan/01-network-manager-all.yaml
sudo add-apt-repository ppa:papirus/papirus -y
sudo apt update
sudo apt upgrade -y
sudo apt install --no-install-recommends gnome -y
sudo apt install gnome-shell-extension-dash-to-panel gnome-shell-extension-desktop-icons gnome-shell-extension-gamemode -y
sudo apt install nemo -y
sudo apt install lightdm lightdm-settings -y
sudo apt install git wget -y
sudo apt install papirus-icon-theme -y
sudo wget https://github.com/SteavenGamerYT/SteavenBuntu/raw/main/pop-gnome-shell-theme_5.3.1_all.deb -P ~/pop-shell-theme.deb
sudo wget https://github.com/SteavenGamerYT/SteavenBuntu/raw/main/pop-gtk-theme_5.3.1_all.deb -P ~/pop-gtk-theme.deb
sudo wget https://github.com/SteavenGamerYT/SteavenBuntu/raw/main/pop-sound-theme_5.3.1_all.deb -P ~/pop-sound-theme.deb
sudo dpkg --force-all -i ~/pop-shell-theme.deb
sudo dpkg --force-all -i ~/pop-gtk-theme.deb
sudo dpkg --force-all -i ~/pop-sound-theme.deb
sudo apt install -f -y
gsettings set org.gnome.desktop.interface gtk-theme Pop
gsettings set org.gnome.desktop.wm.preferences theme Pop
gsettings set org.gnome.desktop.interface icon-theme Papirus-Light