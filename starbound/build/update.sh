#!/bin/bash
echo $1
echo $2
/home/gsc/steamcmd.sh +login $1 $2 $3 +force_install_dir /home/gsc/starbound +app_update 533830 validate +quit
