#!/bin/bash

source "${CONFIG_DIR}/colors.sh"

media=(
  # background.border_color="$(getcolor grey 50)"
  # background.border_width=1
  icon.background.height=20
  icon.background.color=$(getcolor red)
  icon="󰽻"
  icon.color=$(getcolor black)
  label.color=$(getcolor white)
  icon.padding_right=5
  icon.padding_left=6
  label.drawing=off
  label.max_chars=24
  label.padding_left=6
  scroll_texts=on
  label.scroll_duration=250
  padding_right=0 #$PADDINGS
  padding_left=0
  script="$PLUGIN_DIR/media.sh"
  icon.background.corner_radius=3
  # click_script="$PLUGIN_DIR/music.sh"
  updates=on
  --subscribe media media_change mouse.clicked
)

sketchybar \
  --add item media right \
  --set media "${media[@]}"
