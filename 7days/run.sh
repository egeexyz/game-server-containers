#!/bin/bash
TEMP_DIR="/home/gsc/7days"
WORK_DIR="/home/gsc/server_files"
if [ -d "$TEMP_DIR" ]; then
  echo "Beginning initial bootstrap, please wait..."
  cp -r $TEMP_DIR/* $WORK_DIR
  rm -rf $TEMP_DIR
  echo "Bootstrap finished, launching server..."
fi

$WORK_DIR/runserver.sh -configfile=egeeioconfig.xml &
sleep 5
tail -f $WORK_DIR/console.log
