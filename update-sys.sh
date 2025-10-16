#!/bin/sh

# update sys
sudo pacman -Syu

sleep 1

if command -v yay >/dev/null 2>&1; then
  yay -Syu
elif command -v paru >/dev/null 2>&1; then 
  paru -Syu
else
  exit 1
fi


# reboot prompt
echo "do you want to reboot y/n"
read input

if [ "$input" = "y" ]; then
  sudo reboot
else
  echo "rebooting or not idk?"
fi
