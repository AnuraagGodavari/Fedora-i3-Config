#!/bin/bash

# Move to script directory - work from here.

cd "$(dirname "$0")"
echo "Working in $(pwd)"

# Install Packages

sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install -y \
    akmod-nvidia \
    alacritty \
    alsa-sof-firmware \
    arandr \
    bluez bluez-tools \
    brightnessctl \
    cmatrix \
    cowsay \
    copyq \
    dnf-plugins-core \
    feh \
    flatpak \
    i3 \
    lightdm \
    lutris \
    nemo \
    neovim \
    steam \
    rofi \
    picom \
    vim \
    xorg-x11-drv-nvidia \
    xorg-x11-drv-nvidia-cuda \
    zsh 

# Enable LightDm
sudo systemctl enable lightdm.service
sudo systemctl set-default graphical.target

# Install ZSH, OMZ

chsh -s $(where zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Add Flathub

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Add Discord

sudo dnf install libatomic glibc alsa-lib GConf2 libnotify nspr nss libstdc++ libX11 libXtst libappindicator libcxx libXScrnSaver

sudo dnf install discord
sudo flatpak install discord

sudo dnf copr enable observeroftime/betterdiscordctl
sudo dnf install betterdiscordctl

betterdiscordctl install
betterdiscordctl --d-install flatpak install

# Get EnvyControl

sudo dnf copr enable sunwire/envycontrol
sudo dnf install python3-envycontrol

# Get VSCodium

sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium

# Rofi Bluetooth

git clone git@github.com:ClydeDroid/rofi-bluetooth.git ~/Repositories/rofi-bluetooth
