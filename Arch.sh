#!/bin/bash

# Installing yay Aur package helper
sudo pacman -Syu --noconfirm --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..

# install gnome and gdm3
sudo pacman -S --noconfirm --needed gnome gdm
sudo systemctl enable gdm

# Gnome Extensions
yay -S --noconfirm --needed gnome-shell-extension-dash-to-dock gnome-shell-extensions gnome-shell-extension-user-theme-x-git extension-manager

# Configs
wget https://github.com/SteavenGamerYT/Gnome-Customizations/raw/main/Configs/dash-to-dock.txt
dconf load /org/gnome/shell/extensions/dash-to-dock/ < ~/dash-to-dock.txt

# Gnome Tweaks
sudo pacman -S --noconfirm --needed gnome-tweaks

#zsh
yay -S --noconfirm --needed zsh zsh-syntax-highlighting autojump zsh-autosuggestions
touch "~/.cache/zshhistory"
#-- Setup Alias in $HOME/zsh/aliasrc
mkdir ~/.zsh
mkdir ~/.zsh/plugins/
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/plugins/powerlevel10k
echo 'source ~/.zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

# make zsh default
chsh -s $(which zsh)

# fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
sudo unzip FiraCode.zip -d "/usr/share/fonts"
sudo unzip Meslo.zip -d "/usr/share/fonts"
sudo fc-cache -vf
rm ./FiraCode.zip ./Meslo.zip

# theme
sudo git clone https://github.com/EliverLara/Nordic.git /usr/share/themes/Nordic
gsettings set org.gnome.desktop.interface gtk-theme Nordic
gsettings set org.gnome.desktop.wm.preferences theme Nordic

# icon theme
sudo pacman -S --noconfirm --needed papirus-icon-theme
gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark

# Install brave-browser
yay -S --noconfirm --needed brave-bin

# remove firefox
sudo snap remove firefox

# installing vlc
sudo pacman -S --noconfirm --needed vlc 

# make english default
echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment

