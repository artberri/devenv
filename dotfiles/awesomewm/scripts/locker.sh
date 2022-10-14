#!/bin/sh
if [ -n "$(pidof xautolock)" ]; then
  xautolock -exit
  sleep 3
fi
xautolock -time 10 -locker slock
