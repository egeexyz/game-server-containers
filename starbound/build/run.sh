#!/bin/bash
WORK_DIR="/home/gsc/server_files"
if [ ! -f "$WORK_DIR/linux/starbound_server" ]; then
  echo "Game doesn't appear to be installed. Beginning install, please wait..."
  /usr/bin/update
  echo "Install complete. Launching server now..."
fi
$WORK_DIR/linux/starbound_server
