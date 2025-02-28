#!/bin/sh

source "$CONFIG_DIR/colors.sh"

sketchybar --add item frontapp left \
  --set frontapp \
  icon="%" \
  script="$PLUGIN_DIR/front-app.sh" \
  background.color=$(getcolor purple) \
  icon.color=$(getcolor black) \
  label.color=$(getcolor black) \
  background.height=20 \
  background.corner_radius=3 \
  icon.padding_left=6 \
  icon.padding_right=5 \
  padding_left=6 \
  label.padding_right=6 \
  --subscribe frontapp front_app_switched
