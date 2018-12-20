#!/bin/bash
WORK_DIR="/home/gsc/server_files"
cd $WORK_DIR
if [ ! -f "$WORK_DIR/TerrariaServer.exe" ]; then
  /usr/bin/update
  echo "Install complete. Launching server now..."
fi
mono $WORK_DIR/TerrariaServer.exe -config $WORK_DIR/configs.txt
