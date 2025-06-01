#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

if [ "$SENDER" = "front_app_switched" ]; then
  t=$(yabai -m query --windows --window | jq -r '.title')
  if [ ${#t} -ge 10 ]; then
    t=$INFO
  fi
  sketchybar --set "$NAME" label="$t"
fi
