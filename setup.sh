#!/bin/bash
set -e

# configure it to check the OS and update accordingly
sudo pacman -Syu

# more pre-requisites
sudo pamcan -S --needed git base-devel

# install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# add packages
yay git neovim curl tmux ghostty

# setup configs using dotfiles

