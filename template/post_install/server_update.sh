#!/bin/bash

# Available ENV vars:
# $INSTALL_DIR:     Install the server to this directory.
# ! $SERVER_DIR:    Don't use this. The installation directory of the server and this script
# ! $POST_INSTALL:  Don't use this. The directory where some post installation files are mounted (default conf, ...)
# $INITIAL_INSTALL: Is set to "true" when this is the initial installation.
# $CACHE_INSTALL:   This is an installtion while the server is running. $INSTALL_DIR is set to cache automatically.

# UPDATE/INSTALL SERVER FILES HERE

echo "server_update"
exit 0
