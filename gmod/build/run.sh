#!/bin/bash
WORK_DIR="/home/gsc/server_files"
if [ ! -f "$WORK_DIR/srcds_run" ]; then
  echo "Game doesn't appear to be installed. Beginning install, please wait..."
  /usr/bin/update
  mkdir $WORK_DIR/garrysmod
  touch $WORK_DIR/garrysmod/console.log
  echo "Install complete. Launching server now..."
fi
$WORK_DIR/srcds_run \
  -console \
  -game garrysmod \
  +maxplayers 16 \
  +map gm_construct \
  +host_workshop_collection 776121544 \
  -condebug &
tail -f $WORK_DIR/garrysmod/console.log
