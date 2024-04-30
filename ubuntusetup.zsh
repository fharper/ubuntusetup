#!/usr/bin/env zsh


#########################
#                       #
# Script Configurations #
#                       #
#########################

#
# Load the colors function from ZSH
#
autoload colors; colors

#
# Update list of apt-get available packages
#
sudo apt update


####################
#                  #
# Script Functions #
#                  #
####################

#
# Check if an application is already installed
#
# @param apt-get package name
#
# @return exit code (0 is already installed, 1 is not)
#
function isAppInstalled {
    apt list --installed | grep $1

    return $?
}

#
# Install application with apt
#
# @param application's name
#
function install {
    if [[ ! $(isAppInstalled "$1") ]]; then
        echo $fg[blue]"Starting the installation of $1"$reset_color
        sudo apt install "$1"
    else
        echo $fg[green]"Skipped $fg[blue]$1$fg[green] already installed"$reset_color
    fi
}


############################
#                          #
# Utils to run this script #
#                          #
############################

#
# Homebrew + homebrew-cask-versions + brew-cask-upgrade + Casks for Fonts
#
# macOS package manager
# Homebrew dependencies
# Alternate versions of Homebrew Casks
# CLI for upgrading outdated Homebrew Casks
# Casks for Fonts
#
# https://github.com/Homebrew/brew
# https://github.com/Homebrew/homebrew-cask-versions
# https://github.com/buo/homebrew-cask-upgrade
# https://github.com/Homebrew/homebrew-cask-fonts
#
if [[ "$(isCLAppInstalled brew)" = "false" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') > /home/fharper/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    sudo apt-get install build-essential

    brew analytics off
    brew tap homebrew/cask-versions
    brew tap buo/cask-upgrade
    brew tap homebrew/cask-fonts
fi

#
# wget
#
# CLI download tool
#
# https://www.gnu.org/software/wget/
#
install wget


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
install zsh


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
if [[ ! $(isAppInstalled wget) ]]; then
    sudo apt install ca-certificates curl gnupg
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    wget https://desktop.docker.com/linux/main/arm64/docker-desktop-4.28.0-arm64.deb -O docker-desktop.deb
    sudo apt install ./docker-desktop.deb
fi

#
# xrdp
#
# Remote Desktop Protocol Server
#
# https://github.com/neutrinolabs/xrdp
#
sudo apt install xrdp


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
