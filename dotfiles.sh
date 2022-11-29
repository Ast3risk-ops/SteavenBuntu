#!/bin/bash

# remove old bash and zsh and p10k configs
rm -rf ~/.zshrc
rm -rf ~/.bashrc
rm -rf ~/.p10k.zsh

# download new
wget https://github.com/SteavenGamerYT/Gnome-Customizations/raw/main/dotfiles/.zshrc -P ~
wget https://github.com/SteavenGamerYT/Gnome-Customizations/raw/main/dotfiles/.bashrc -P ~
wget https://github.com/SteavenGamerYT/Gnome-Customizations/raw/main/dotfiles/.p10k.zsh -P ~

# neofetch
mkdir ~/.config/neofetch/
rm -rf ~/.config/neofetch/config.conf
wget https://github.com/SteavenGamerYT/Gnome-Customizations/raw/main/dotfiles/config.conf -P ~/.config/neofetch/
