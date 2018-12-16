#!/bin/bash
WORK_DIR="/home/gsc/server_files"

cd $WORK_DIR
wget "https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"
java -jar $WORK_DIR/BuildTools.jar --rev 1.13.1
