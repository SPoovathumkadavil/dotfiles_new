#!/bin/bash

source "${CONFIG_DIR}/colors.sh"

# sketchybar --add event aerospace_workspace_change
sketchybar --add event workspace_change

# for sid in $(aerospace list-workspaces --all); do
for sid in $(yabai -m query --spaces | jq '.[].index'); do
  SPACE_COLOR_1=$HIGHLIGHT
  SPACE_COLOR_2=$(getcolor yellow)
  # LABEL=$(yabai -m query --spaces --space $sid | jq -r '.label')
  # if [[ -z $LABEL ]]; then
  #   LABEL=$sid
  # fi
  sketchybar --add item space.$sid left \
    --subscribe space.$sid workspace_change mouse.clicked front_app_switched \
    --set space.$sid background.color=$TRANSPARENT \
    background.corner_radius=3 \
    background.drawing=on \
    background.height=20 \
    icon.padding_left=6 \
    icon.padding_right=6 \
    label.drawing=off \
    label.padding_left=0 \
    label.padding_right=6 \
    padding_right=0 \
    padding_left=0 \
    icon.color=$(getcolor white 50) \
    icon="$sid" \
    script="$CONFIG_DIR/plugins/spaces.sh $sid $SPACE_COLOR_1 $SPACE_COLOR_2"
done
