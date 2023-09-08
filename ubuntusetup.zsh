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
