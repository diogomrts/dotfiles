#!/usr/bin/env bash

#polybar-msg cmd quit
#polybar example 2>&1 | tee -a /tmp/polybar.log & disown
#echo "Bars launched..."


# Launch bar on each monitor, tray on primary
polybar --list-monitors | while IFS=$'\n' read line; do
  monitor=$(echo $line | cut -d':' -f1)
  primary=$(echo $line | cut -d' ' -f3)
  MONITOR=$monitor polybar --reload "top${primary:+"-primary"}" &
done
