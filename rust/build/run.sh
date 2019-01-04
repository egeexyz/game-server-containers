#!/bin/bash
POST_BUILD_DIR="/home/gsc/post_build"
WORK_DIR="/home/gsc/server_files"
if [ ! -f "$WORK_DIR/RustDedicated" ]; then
  echo "Game doesn't appear to be installed. Beginning install, please wait..."
  /usr/bin/update
  touch $WORK_DIR/console.log
  echo "Install complete. Launching server now..."
fi

$WORK_DIR/RustDedicated \
  +server.ip ${IP} \
  +server.port ${PORT} \
  +server.tickrate ${TICKRATE} \
  +server.identity ${SERVER_ID} \
  +server.saveinterval ${SAVEINTERVAL} \
  +rcon.web ${RCONWEB} \
  +rcon.ip ${IP} \
  +rcon.port ${RCONPORT} \
  +rcon.password ${RCONPASSWORD} \
  -logfile $WORK_DIR/console.log &
tail -f $WORK_DIR/console.log
