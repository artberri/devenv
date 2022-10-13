#!/usr/bin/env bash
# .scripts/awesome_autostart.sh
# Launch Apps when AwesomeWM starts.

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run ~/.config/awesome/awesome_display_layout.sh &
