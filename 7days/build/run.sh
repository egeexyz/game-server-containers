#!/bin/bash
POST_BUILD_DIR="/home/gsc/post_build"
WORK_DIR="/home/gsc/server_files"
if [ ! -f "$WORK_DIR/startserver.sh" ]; then
  echo "Game doesn't appear to be installed. Beginning install, please wait..."
  /usr/bin/update
  touch $WORK_DIR/console.log
  rm $WORK_DIR/startserver.sh
  rm $WORK_DIR/serverconfig.xml
  cp $POST_BUILD_DIR/startserver.sh $WORK_DIR/startserver.sh
  cp $POST_BUILD_DIR/serverconfig.xml $WORK_DIR/serverconfig.xml
  echo "Install complete. Launching server now..."
fi

$WORK_DIR/startserver.sh -configfile=serverconfig.xml &
tail -f $WORK_DIR/console.log
