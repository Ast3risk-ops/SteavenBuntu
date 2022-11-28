#!/bin/bash


# nala
sudo apt install nala -y

#zsh
sudo nala install zsh zsh-syntax-highlighting autojump zsh-autosuggestions -y
touch "$HOME/.cache/zshhistory"
#-- Setup Alias in $HOME/zsh/aliasrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/,zsh/plugins/powerlevel10k
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
sudo git clone https://github.com/EliverLara/Nordic.git /usr/share/themes/
gsettings set org.gnome.desktop.interface gtk-theme Nordic
gsettings set org.gnome.desktop.wm.preferences theme Nordic

# icon theme
sudo nala install papirus-icon-theme -y
gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark

# Install brave-browser
sudo nala install apt-transport-https curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo nala update
sudo nala install brave-browser -y

# remove firefox
sudo snap remove firefox

# ubuntu spyware remover
sudo apt purge ubuntu-report popularity-contest apport whoopsie -y
sudo apt autoremove --purge -y

# installing vlc
sudo nala install vlc -y

# make english default
echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment

