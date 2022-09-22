#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install --no-install-recommends gnome -y
sudo apt install lightdm lightdm-settings -y
sudo apt install git wget -y