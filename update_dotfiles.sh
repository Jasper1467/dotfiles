#!/bin/bash

sudo cp -r ~/.bashrc ./.bashrc

sudo cp -r ~/.config/kitty/ ./kitty
sudo cp -r ~/.config/nvim/ ./nvim

sudo mkdir ./etc
sudo mkdir ./etc/pacman.d

sudo cp -r /etc/pacman.conf ./etc/
sudo cp -r /etc/pacman.d/mirrorlist ./etc/pacman.d/
sudo cp -r /etc/makepkg.conf ./etc/
sudo cp -r /etc/environment ./etc/
