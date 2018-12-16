#!/bin/bash
cd /home/gsc/server_files
wget "https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"
which git
java -jar BuildTools.jar --rev 1.13
