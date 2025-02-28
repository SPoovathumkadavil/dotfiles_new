#!/bin/sh

FOCUSED_APP=$(yabai -m query --windows --window | jq -r '.app')

if [[ -z "$FOCUSED_APP" ]]; then
  LABEL_DRAWING="off"
else
  LABEL_DRAWING="on"
fi
sketchybar --animate tanh 20 \
  --set $NAME label.drawing=$LABEL_DRAWING label="$FOCUSED_APP"
