#!/bin/bash

##################
# GSC Run Script #
# Version 0.1.0  #
##################

if [ ! -f "$SERVER_DIR/server_start.sh" ]; then
  echo "Sever files not found. Performing initial installation..."

  cp -r $POST_INSTALL/*  $SERVER_DIR/
  chmod +x $SERVER_DIR/server_start.sh
  chmod +x $SERVER_DIR/server_update.sh

  update
fi

if [ -d "$CACHE_DIR" ]; then
  echo "Beginning initial bootstrap, please wait..."
  cp -r $CACHE_DIR/* $SERVER_DIR
  rm -rf $CACHE_DIR
  echo "Bootstrap finished, launching server..."
fi

chmod +x $SERVER_DIR/server_start.sh
$SERVER_DIR/server_start.sh
