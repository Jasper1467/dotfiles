#!/bin/bash

sudo cp -r ~/.zshrc ./.zshrc

sudo mkdir ./.config

sudo cp -r ~/.config/kitty/ ./.config/
sudo cp -r ~/.config/nvim/ ./.config/

sudo mkdir ./etc

sudo cp -r /etc/pacman.conf ./etc/
sudo cp -r /etc/makepkg.conf ./etc/
sudo cp -r /etc/nanorc ./etc/nanorc
