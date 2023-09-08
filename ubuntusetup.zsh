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
