#!/bin/bash
touch /opt/rustserver/server.log
/opt/rustserver/RustDedicated \
  +server.ip ${IP} \
  +server.port ${PORT} \
  +server.tickrate ${TICKRATE} \
  +server.identity ${SERVER_ID} \
  +server.saveinterval ${SAVEINTERVAL} \
  +rcon.web ${RCONWEB} \
  +rcon.ip ${IP} \
  +rcon.port ${RCONPORT} \
  +rcon.password ${RCONPASSWORD} \
  -logfile server.log &
tail -f /opt/rustserver/server.log
