#!/bin/sh

# if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
#     sketchybar --set $NAME background.drawing=on
# else
#     sketchybar --set $NAME background.drawing=off
# fi

source "${CONFIG_DIR}/colors.sh"

SID=$1
SPACE_COLOR_1=$2
SPACE_COLOR_2=$3
# PREV_SID=$PREV_WORKSPACE
PREV_SID=$(yabai -m query --spaces --space recent | jq '.index')
# CURRENT_SID=$FOCUSED_WORKSPACE
CURRENT_SID=$(yabai -m query --spaces --space | jq '.index')
SID_1=$(yabai -m query --spaces | jq '.[] | select(."is-visible"==true) | select(.display==1) | .index')
SID_2=$(yabai -m query --spaces | jq '.[] | select(."is-visible"==true) | select(.display==2) | .index')
# FOCUSED_APP=$(aerospace list-windows --focused --format '%{app-name}')
# FOCUSED_APP=$(yabai -m query --windows --window | jq -r '.app')

update_colors_m() {
  if [[ "$SID" == "$PREV_SID" ]]; then
    if [[ "$SID" == "$SID_1" || "$SID" == "$SID_2" ]]; then
      echo "switched displays"
    else
      sketchybar --animate tanh 20 \
        --set space.$PREV_SID background.color=$TRANSPARENT \
        icon.color=$(getcolor white 50) \
        label.color=$BAR_COLOR
    fi
  elif [[ "$SID" == "$CURRENT_SID" ]]; then
    if [[ "$SID_1" == "$CURRENT_SID" ]]; then
      c=$SPACE_COLOR_1
    else
      c=$SPACE_COLOR_2
    fi
    sketchybar --animate tanh 20 \
      --set space.$CURRENT_SID background.color=$c \
      icon.color=$(getcolor black 80) \
      label.color=$(getcolor black 80)
  fi
}

update_colors_s() {
  if [[ "$SID" == "$PREV_SID" ]]; then
    sketchybar --animate tanh 20 \
      --set space.$PREV_SID background.color=$TRANSPARENT \
      icon.color=$(getcolor white 50) \
      label.color=$BAR_COLOR
  elif [[ "$SID" == "$CURRENT_SID" ]]; then
    sketchybar --animate tanh 20 \
      --set space.$CURRENT_SID background.color=$SPACE_COLOR \
      icon.color=$(getcolor black 80) \
      label.color=$(getcolor black 80)
  fi
  # debug "update_colors"
}

update_label() {
  if [[ "$SID" == "$CURRENT_SID" ]]; then
    if [[ -z "$FOCUSED_APP" ]]; then
      LABEL_DRAWING="off"
    else
      LABEL_DRAWING="on"
    fi
    sketchybar --animate tanh 20 \
      --set space.$CURRENT_SID label.drawing=$LABEL_DRAWING \
      label="$FOCUSED_APP"
    # debug "update_label"
  fi
}

remove_label() {
  if [[ "$SID" == "$PREV_SID" ]]; then
    sketchybar --animate tanh 20 --set space.$PREV_SID label.drawing=off
    # debug "remove_label"
  fi
}

mouse_clicked() {
  # if [[ "$MODIFIER" == "cmd" ]]; then
  # aerospace workspace --wrap-around next
  # else
  # aerospace workspace $SID
  yabai -m space --focus $SID
  # fi
}

set_space_label() {
  sketchybar --set $NAME label="$@"
}

debug() {
  echo $SENDER "| sid:" $SID "| curr:" $CURRENT_SID "| prev:" $PREV_SID "[$1]"
  # echo $INFO
}

case "$SENDER" in
# "routine" | "forced" | "aerospace_workspace_change")
"routine" | "forced" | "workspace_change")
  update_colors_m
  # update_label
  # remove_label
  # debug
  ;;
"front_app_switched")
  # update_label
  ;;
"mouse.clicked")
  mouse_clicked
  ;;
esac
