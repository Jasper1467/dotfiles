#!/bin/bash

sudo cp -r ~/.bashrc ./.bashrc

sudo mkdir ./.config

sudo cp -r ~/.config/kitty/ ./.config/kitty
sudo cp -r ~/.config/nvim/ ./.config/nvim

sudo mkdir ./etc
sudo mkdir ./etc/pacman.d
sudo mkdir ./etc/sysctl.d

sudo cp -r /etc/mkinitcpio.conf ./etc/mkinitcpio.conf
sudo cp -r /etc/pacman.conf ./etc/
sudo cp -r /etc/pacman.d/mirrorlist ./etc/pacman.d/
sudo cp -r /etc/makepkg.conf ./etc/
sudo cp -r /etc/environment ./etc/
sudo cp -r /etc/sysctl.d/99-sysctl.conf ./etc/sysctl.d/
