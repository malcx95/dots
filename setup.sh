#!/bin/bash


# # Elevate to root and install the latest git
sudo ls > /dev/null
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update
sudo apt install -y git xclip

# Configure git
git config --global user.name "Malcolm Vigren"
git config --global user.email "trekommafem2@gmail.com"


# install packages
sudo apt install -y wget build-essential libncursesw5-dev libssl-dev \
libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev


sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo add-apt-repository ppa:freecad-maintainers/freecad-stable -y
sudo apt update

sudo apt install -y build-essential cmake python3-dev mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm freecad-common


# Get dots repo
git clone git@github.com:malcx95/dots.git
rm dots/setup.sh
cp -r dots/* .
rm -rf dots

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim -c PluginInstall -c 'qa!'

# Compile YCM
cd .vim/bundle/YouCompleteMe
python3 install.py --rust-completer --clang-completer --cs-completer --ts-completer

cd ~

# install i3
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2023.02.18_all.deb keyring.deb SHA256:a511ac5f10cd811f8a4ca44d665f2fa1add7a9f09bef238cdfad8461f5239cc4
sudo apt install ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update

sudo apt install -y xorg lightdm lightdm-gtk-greeter i3-wm i3status i3blocks dmenu terminator feh materia-gtk-theme papirus-icon-theme lxappearance fonts-font-awesome playerctl picom rofi

# install i3-lock-color
sudo apt install -y autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
./install-i3lock-color.sh
rm -rf i3lock-color
cd ~
