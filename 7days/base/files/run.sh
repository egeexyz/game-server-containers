#!/bin/bash
WORK_DIR="/home/gsc/server_files"
if [ ! -f "$WORK_DIR/startserver.sh" ]; then
  echo "Game doesn't appear to be installed. Beginning install, please wait..."
  /usr/bin/update
  mv $WORK_DIR/startserver.sh $WORK_DIR/startserver.sh.old
  echo "Install complete. Launching server now..."
fi

$WORK_DIR/runserver.sh -configfile=egeeioconfig.xml &
sleep 1
tail -f $WORK_DIR/console.log
