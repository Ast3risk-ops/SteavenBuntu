#!/bin/bash

rm -rf ~/.zshrc
wget https://github.com/SteavenGamerYT/Gnome-Customizations/raw/main/dotfiles/.zshrc -P ~
rm -rf ~/.bashrc
wget https://github.com/SteavenGamerYT/Gnome-Customizations/raw/main/dotfiles/.bashrc -P ~
rm -rf ~/.p10k.zsh
wget https://github.com/SteavenGamerYT/Gnome-Customizations/raw/main/dotfiles/.p10k.zsh -P ~
