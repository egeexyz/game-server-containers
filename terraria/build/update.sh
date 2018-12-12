#!/bin/bash
VERSION="$1"
wget "https://github.com/Pryaxis/TShock/releases/download/v${VERSION}/tshock_${VERSION}.zip"
unzip -x tshock*.zip
chmod +x /home/gsc/TerrariaServer.exe
