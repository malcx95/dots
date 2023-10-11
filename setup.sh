#!/bin/bash


# Elevate to root and install the latest git
sudo ls > /dev/null
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update
sudo apt install -y git xclip

# Configure git
git config --global user.name "Malcolm Vigren"
git config --global user.email "trekommafem2@gmail.com"
ssh-keygen -t ed25519 -C "trekommafem2@gmail.com"

cat ~/.ssh/id_ed25519.pub | xclip -selection clipboard
cat ~/.ssh/id_ed25519.pub
read -p "

SSH public key copied to clipboard. Add to github/gitlab. Press any key to continue..."

# install packages
sudo apt install -y wget build-essential libncursesw5-dev libssl-dev \
libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev


sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo add-apt-repository ppa:freecad-maintainers/freecad-stable -y
sudo apt update

sudo apt install -y vim-gnome build-essential cmake python3-dev mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm freecad-common

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Get dots repo
git clone git@github.com:malcx95/dots.git
cp -r dots/* .
rm -rf dots

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim -c PluginInstall -c 'qa!'

# Compile YCM
cd .vim/bundle/YouCompleteMe
python install.py --rust-completer --clang-completer --cs-completer --ts-completer

cd ~


# install i3
sudo apt install -y xorg lightdm lightdm-gtk-greeter i3-wm i3lock i3status i3blocks dmenu terminator feh materia-gtk-theme papirus-icon-theme lxappearance fonts-font-awesome
