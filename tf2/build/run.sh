#!/bin/bash
WORK_DIR="/home/gsc/server_files"
if [ ! -f "$WORK_DIR/srcds_run" ]; then
  echo "Game doesn't appear to be installed. Beginning install, please wait..."
  /usr/bin/update
  touch $WORK_DIR/tf/console.log
  echo "Install complete. Launching server now..."
fi

# You will probably see the error below in the logs:
# /home/gsc/.steam/sdk32/steamclient.so: cannot open shared object file: No such file or directory
# This error is fine; you can ignore it.

$WORK_DIR/srcds_run \
  -console \
  -game tf \
  +sv_pure 1 \
  +map ctf_2fort \
  +maxplayers 24 \
  -condebug &
tail -f $WORK_DIR/tf/console.log
