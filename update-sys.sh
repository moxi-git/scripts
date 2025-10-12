#!/bin/sh

# update sys
sudo pacman -Sy && sudo pacman -Syu

# reboot prompt
echo "do you want to reboot y/n"
read input

if [ "$input" = "y" ]; then
  sudo reboot
else
  echo "not right input"
fi
