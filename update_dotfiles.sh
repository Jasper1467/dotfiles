#!/bin/bash

sudo cp -r ~/.bashrc ./.bashrc

sudo mkdir ./.config

sudo cp -r ~/.config/kitty/ ./.config/
sudo cp -r ~/.config/nvim/ ./.config/
sudo cp -r ~/.config/helix/ ./.config/

sudo mkdir ./etc
sudo mkdir ./etc/pacman.d
sudo mkdir ./etc/sysctl.d
sudo mkdir ./etc/makepkg.conf.d
sudo mkdir ./etc/makepkg.conf.d/linux-config

sudo cp -r /etc/mkinitcpio.conf ./etc/mkinitcpio.conf
sudo cp -r /etc/pacman.conf ./etc/
sudo cp -r /etc/pacman.d/mirrorlist ./etc/pacman.d/
sudo cp -r /etc/makepkg.conf ./etc/
sudo cp -r /etc/makepkg.conf.d/rust.conf ./etc/makepkg.conf.d/
sudo cp -r /etc/makepkg.conf.d/fortran.conf ./etc/makepkg.conf.d/
sudo cp -r /etc/makepkg.conf.d/napture.conf ./etc/makepkg.conf.d/
sudo cp -r /etc/makepkg.conf.d/linux-lts.conf ./etc/makepkg.conf.d/
sudo cp -r /etc/makepkg.conf.d/linux-config/.config ./etc/makepkg.conf.d/linux-config/
sudo cp -r /etc/sysctl.d/99-sysctl.conf ./etc/sysctl.d/
sudo cp -r /etc/nanorc ./etc/nanorc
sudo cp -r /etc/environment ./etc/
sudo cp -r /etc/nanorc ./etc/nanorc
