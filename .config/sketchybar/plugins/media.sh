#!/bin/bash

source "${CONFIG_DIR}/colors.sh"

PLAYER="$(echo "$INFO" | jq -r '.app')"
PLAYERSTATE="$(echo "$INFO" | jq -r '.state')"
CURRENTARTIST="$(echo "$INFO" | jq -r '.artist')"
CURRENTSONG="$(echo "$INFO" | jq -r '.title')"

ARGS=()
if [[ "$PLAYERSTATE" = "playing" ]]; then
  # ARGS+=(icon="" background.drawing=on background.image=media.artwork)
  # ARGS+=(icon.color=$(getcolor green))
  ARGS+=(icon.background.color=$(getcolor green))
else
  # ARGS+=(icon.color=$(getcolor red))
  ARGS+=(icon.background.color=$(getcolor red))
fi
if [[ "$CURRENTSONG" = "" ]]; then
  ARGS+=(label.drawing=off)
else
  ARGS+=(label.drawing=on label="$CURRENTSONG :: $CURRENTARTIST")
fi
sketchybar --set $NAME "${ARGS[@]}"

if [[ $SENDER == "mouse.clicked" ]]; then
  if [[ "$MODIFIER" == "cmd" ]]; then
    ACTION="activate"
  elif [[ "$MODIFIER" == "shift" ]]; then
    ACTION="next track"
  elif [[ "$MODIFIER" == "none" ]]; then
    ACTION="playpause"
  fi
  osascript -e "tell application \"Music\" to $ACTION"
fi
