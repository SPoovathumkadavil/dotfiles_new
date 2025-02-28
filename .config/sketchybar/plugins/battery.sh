#!/bin/sh

source "${CONFIG_DIR}/colors.sh"

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

send=()

case ${PERCENTAGE} in
  9[0-9]|100) send=(icon="" icon.color=$(getcolor green))
  ;;
  [6-8][0-9]) send=(icon="" icon.color=$(getcolor green))
  ;;
  [3-5][0-9]) send=(icon="" icon.color=$(getcolor yellow))
  ;;
  [1-2][0-9]) send=(icon="" icon.color=$(getcolor red))
  ;;
  *) send+=(icon="" icon.color=$(getcolor red))
esac

if [[ $CHARGING != "" ]]; then
  send=(icon="" icon.color=$(getcolor yellow))
fi

sketchybar --set $NAME "${send[@]}"
