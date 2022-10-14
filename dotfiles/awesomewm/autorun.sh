#!/usr/bin/env bash
# .scripts/awesome_autostart.sh
# Launch Apps when AwesomeWM starts.

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run ~/.config/awesome/scripts/display_layout.sh &
run ~/.config/awesome/scripts/locker.sh &
