#!/bin/sh

sketchybar --add item clock right \
  --set clock \
  update_freq=60 \
  icon="" \
  script="$PLUGIN_DIR/clock.sh" \
  icon.padding_left=0 \
  padding_left=0 \
  padding_right=5 \
  --add item battery right \
  --set battery script="$PLUGIN_DIR/battery.sh" \
  update_freq=120 \
  label.drawing=off \
  icon.padding_right=0 \
  padding_right=0 \
  padding_left=0 \
  --subscribe battery system_woke power_source_change
