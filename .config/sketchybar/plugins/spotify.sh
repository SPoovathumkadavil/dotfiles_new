#!/bin/bash

source "${CONFIG_DIR}/colors.sh"

if ! osascript -e 'application "Spotify" is running'; then
  echo "Spotify is not running"
  exit 0
fi

update_label() {
  inst=()
  state=$(osascript -e 'tell application "Spotify" to player state as string')
  if [ "$state" = "paused" ]; then
    inst+=(icon.color=$(getcolor white))
  else 
    song=$(osascript -e 'tell application "Spotify" to name of current track as string')
    artist=$(osascript -e 'tell application "Spotify" to artist of current track as string')
    inst+=(icon.color=$(getcolor green) label="$artist - $song")
  fi
  sketchybar --set $NAME "${inst[@]}"
}

mouse_clicked() {
  if [[ "$MODIFIER" == "shift" ]]; then
    ACTION="next track"
  elif [[ "$MODIFIER" == "none" ]]; then
    ACTION="playpause"
  fi
  osascript -e "tell application \"Spotify\" to $ACTION" 
}

case "$SENDER" in
"media_change")
  update_label
  ;;
"mouse.clicked")
  mouse_clicked
  ;;
esac
