#!/bin/sh

# update sys
sudo pacman -Syu

sleep 1

yay -Syu

# reboot prompt
echo "do you want to reboot y/n"
read input

if [ "$input" = "y" ]; then
  sudo reboot
else
  echo "not right input"
fi
