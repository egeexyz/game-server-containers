#!/bin/bash

#####################
# GSC Update Script #
#   Version 0.1.0   #
#####################

INSTALL_DIR="$SERVER_DIR"

# Check if server is running and if so, download to cache
if pgrep server_start.sh &> /dev/null; then
  echo "Server is active. Installing to cache..."
  INSTALL_DIR="$CACHE_DIR"
  mkdir -p "$INSTALL_DIR"
  CACHE_INSTALL=true
fi

if [ ! -f $SERVER_DIR/server_update.sh ]; then
  cp $POST_INSTALL/server_update.sh $SERVER_DIR/
fi

export CACHE_INSTALL
export INSTALL_DIR
chmod +x $SERVER_DIR/server_update.sh
$SERVER_DIR/server_update.sh
