#!/bin/bash
set -e

cd ~

# configure it to check the OS and update accordingly
sudo pacman -Syu

# more pre-requisites
sudo pamcan -S --needed git base-devel

# install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# A list of packages I require:
# git neovim curl tmux ghostty

# Just for fun, ladybird install
echo "./Meta/ladybird.py run" >> ./ladybird.sh
git clone https://github.com/LadyBirdBrowser/ladybird.git
cd  ~/ladybird
chmod u+x ./ladybird.sh
./Meta/ladybird.py run

# add packages
yay git neovim curl tmux ghostty

# setup configs using dotfiles
ln -s "~/.dotfiles/ghostty/config.ghostty" "~/.config/ghostty/config.ghostty"
ln -s "~/.dotfiles/tmux/.tmux.conf" "~/.tmux.conf"

# special config for setting up fonts in root protected usr/share/fonts directory
sudo ln -sfn "~/.dotfiles/nerdfonts/" "/usr/share/fonts/nerdfonts"
sudo fc-cache -f -v
