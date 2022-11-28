#!/bin/bash

# Installing yay Aur package helper
sudo pacman -Syu --noconfirm --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# install gnome and gdm3
sudo pacman -Syu --noconfirm --needed gnome gdm

#zsh
sudo pacman -Syu --noconfirm --needed zsh zsh-syntax-highlighting autojump zsh-autosuggestions
touch "$HOME/.cache/zshhistory"
#-- Setup Alias in $HOME/zsh/aliasrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/,zsh/plugins/powerlevel10k
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
sudo git clone https://github.com/EliverLara/Nordic.git /usr/share/themes/
gsettings set org.gnome.desktop.interface gtk-theme Nordic
gsettings set org.gnome.desktop.wm.preferences theme Nordic

# icon theme
sudo pacman -Syu --noconfirm --needed papirus-icon-theme
gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark

# Install brave-browser
yay -Syu --noconfirm --needed brave-browser

# remove firefox
sudo snap remove firefox

# installing vlc
sudo pacman -Syu --noconfirm --needed vlc 

# make english default
echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment

