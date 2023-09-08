#!/usr/bin/env zsh


#########################
#                       #
# Script Configurations #
#                       #
#########################

#
# Update list of apt-get available packages
#
sudo apt update


############################
#                          #
# Utils to run this script #
#                          #
############################

#
# wget
#
# CLI download tool
#
# https://www.gnu.org/software/wget/
#
sudo apt install wget


###########################
#                         #
# Top Helper Applications #
#                         #
###########################

#
# ZSH
#
# Interactive shell
#
# https://github.com/zsh-users/zsh
#
sudo apt-get install zsh


########################
#                      #
# Applications Cleanup #
#                      #
########################

# AisleRiotSolitaire
sudo apt remove --purge aisleriot

# Byobu Terminal
sudo apt remove --purge byobu

# LibreOffice
#sudo apt remove --purge libreoffice\* # ZSH
sudo apt remove --purge 'libreoffice*'

# Mahjongg
sudo apt remove --purge gnome-mahjongg

# Mines
sudo apt remove --purge gnome-mines

# Remmina
sudo apt remove --purge 'remmina*'

# Sudoku
sudo apt remove --purge gnome-sudoku

# Thunderbird
sudo apt remove --purge 'thunderbird*'


################
#              #
# Applications #
#              #
################

#
# Docker Desktop
#
# Virtualization tool
#
# https://www.docker.com
#
sudo apt install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
wget https://desktop.docker.com/linux/main/arm64/docker-desktop-4.22.0-arm64.deb -O docker-desktop.deb
sudo apt install ./docker-desktop.deb


###############
#             #
# Final Steps #
#             #
###############

#
# Clean apt packages
#
sudo apt clean
sudo apt autoremove
