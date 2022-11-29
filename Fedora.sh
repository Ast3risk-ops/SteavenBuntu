#!/bin/bash

# RPM Fusion

sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf group update core -y

# Gnome Extensions
sudo dnf install gnome-shell-extension-manager gnome-shell-extensions -y 

#zsh
sudo dnf install zsh zsh-syntax-highlighting autojump zsh-autosuggestions -y
touch "~/.cache/zshhistory"
#-- Setup Alias in $HOME/zsh/aliasrc
mkdir ~/.zsh
mkdir ~/.zsh/plugins/
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/plugins/powerlevel10k
echo 'source ~/.zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

# make zsh default
sudo chsh -s /bin/zsh omarhanykasban
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

# gtk 4 support
wget https://github.com/odziom91/libadwaita-themes/raw/main/nordic/nordic-v42.zip
sudo unzip nordic-v42.zip -d "/root/.config/"
unzip nordic-v42.zip -d "~/.config/"

# icon theme
sudo dnf install papirus-icon-theme -y
gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark

# Install brave-browser
sudo dnf install dnf-transport-https curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-dnf-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-dnf-release.s3.brave.com/ stable main" | sudo tee /etc/dnf/sources.list.d/brave-browser-release.list
sudo dnf update
sudo dnf install brave-browser -y

# remove firefox
sudo snap remove firefox

# ubuntu spyware remover
sudo dnf purge ubuntu-report popularity-contest apport whoopsie -y
sudo dnf autoremove --purge -y

# installing vlc
sudo dnf install vlc -y

# install snaps
sudo dnf install snapd -y
sudo ln -s /var/lib/snapd/snap /snap

# power managment
sudo dnf purge -y power-profiles-daemon
sudo snap install auto-cpufreq
sudo auto-cpufreq --install

# make english default
echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment

