#!/bin/bash
export PATH=$PATH:/home/gsc/.local/bin
WORK_DIR="/home/gsc/server_files"
if [ ! -f "/home/gsc/.local/bin/piqueserver" ]; then
  echo "Game doesn't appear to be installed. Beginning install, please wait..."
  /usr/bin/update
  # mkdir ~/.config && mkdir ~/.config/piqueserver
  echo "Install complete. Launching server now..."
fi
# ln -s $WORK_DIR ~/.config/piqueserver
piqueserver
