#!/bin/bash
TEMP_DIR="/home/gsc/terraria"
WORK_DIR="/home/gsc/server_files"
echo "before"
if [ -d "$TEMP_DIR" ]; then
  echo "Beginning initial bootstrap, please wait..."
  cp -r $TEMP_DIR/* $WORK_DIR
  rm -rf $TEMP_DIR
  echo "Bootstrap finished, launching server..."
fi
cd $WORK_DIR
mono TerrariaServer.exe -config $WORK_DIR/config.txt
