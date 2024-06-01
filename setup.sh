#!/bin/bash

read -p "Before running, add an SSH key to your GitHub account. Press enter to continue."

echo "If you have a HiDPi screen, please create an ~/.Xresources file with the following content:"
echo "Xft.dpi: 200 (or whichever DPI you want)"
sleep 1

# # get initial wallpaper
cd Pictures
mkdir -p wallpapers
cd ~
echo "Remember to download at least one wallpaper and put it in ~/Pictures/wallpapers/"
sleep 1

# # Elevate to root and install the latest git
sudo ls > /dev/null
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update
sudo apt install -y git xclip

# Configure git
git config --global user.name "Malcolm Vigren"
git config --global user.email "trekommafem2@gmail.com"


# install packages
sudo apt install -y wget build-essential libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev

sudo apt install thunar
sudo apt install -y build-essential cmake python3-dev python-is-python3 python3-pip mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm

pip install imageio numpy scipy matplotlib opencv-python

# Get dots repo
git clone git@github.com:malcx95/dots.git
rm dots/setup.sh
cp -r dots/* .
cp -r dots/.???* .
rm -rf dots

cd ~

# install i3
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2023.02.18_all.deb keyring.deb SHA256:a511ac5f10cd811f8a4ca44d665f2fa1add7a9f09bef238cdfad8461f5239cc4
sudo apt install ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update
sudo apt install i3

sudo apt install -y xorg lightdm lightdm-gtk-greeter i3status i3blocks dmenu feh materia-gtk-theme papirus-icon-theme lxappearance fonts-font-awesome playerctl picom rofi
rm keyring.deb

# install i3-lock-color
sudo apt install -y autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
./install-i3lock-color.sh
rm -rf i3lock-color
cd ~


# install neovim
sudo apt install -y ninja-build gettext cmake unzip curl build-essential
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb

# install nerd fonts
mkdir .fonts -p
mkdir UbuntuMono
cd UbuntuMono
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/UbuntuMono.zip
unzip UbuntuMono.zip
cp *.ttf ~/.fonts/
cd ~
rm -rf UbuntuMono

echo ""
echo ""
echo "Don't forget to set the Ubuntu Mono Nerd font in the settings!"
echo ""
echo ""
sleep 1

# install latest nodejs (required by github copilot)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 20

# install polybar
sudo apt install -y build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev

sudo apt install -y libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev

wget https://github.com/polybar/polybar/releases/download/3.7.1/polybar-3.7.1.tar.gz
tar xvzf polybar-3.7.1.tar.gz
rm polybar-3.7.1.tar.gz
cd polybar-3.7.1

mkdir build
cd build
cmake ..
make -j$(nproc)
# Optional. This will install the polybar executable in /usr/bin
sudo make install
cd ~

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

install git-delta
wget https://github.com/dandavison/delta/releases/download/0.17.0/git-delta_0.17.0_amd64.deb
sudo dpkg -i git-delta_0.17.0_amd64.deb
rm git-delta_0.17.0_amd64.deb


# install i3-sortlock
cd ~
mkdir Programming
cd Programming
git clone git@github.com:malcx95/i3-sortlock.git
cd ~

echo "Don't forget to set the theme in lxappearance"
