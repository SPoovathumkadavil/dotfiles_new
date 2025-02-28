#!/bin/bash

source "${CONFIG_DIR}/colors.sh"

POPUP_OFF='sketchybar --set logo popup.drawing=off'
FONT="JetBrainsMono Nerd Font"

logo=(
  popup.blur_radius=32
  popup.background.color=$POPUP_BACKGROUND_COLOR
  popup.background.corner_radius=6
  popup.background.shadow.drawing=on
  popup.background.shadow.color=$(getcolor black 50)
  popup.background.shadow.angle=90
  popup.background.shadow.distance=16
  icon="$"
  background.height=20
  background.color=$(getcolor purple)
  background.corner_radius=3
  icon.color=$(getcolor black)
  icon.padding_left=6
  icon.padding_right=6
  padding_right=6
  label.drawing=off
  popup.align=left
  click_script="sketchybar --set logo popup.drawing=toggle"
  --subscribe logo mouse.exited
  mouse.exited.global
)

logo_about=(
  label.font="$FONT:Regular:12"
  padding_left=6
  padding_right=6
  icon.padding_left=0
  icon.padding_right=4
  icon.color=$HIGHLIGHT
  background.color=$TRANSPARENT
  scroll_texts=on
  icon=a
  label="About This Mac"
  click_script="open x-apple.systempreferences:com.apple.SystemProfiler.AboutExtension; $POPUP_OFF"
)

logo_settings=(
  label.font="$FONT:Regular:12"
  padding_left=6
  padding_right=6
  icon.padding_left=0
  icon.padding_right=4
  icon.color=$HIGHLIGHT
  background.color=$TRANSPARENT
  scroll_texts=on
  icon=s
  label="System Settings"
  click_script="open -a 'System Settings'; $POPUP_OFF"
)

logo_sleep=(
  label.font="$FONT:Regular:12"
  padding_left=6
  padding_right=6
  icon.padding_left=0
  icon.padding_right=4
  icon.color=$HIGHLIGHT
  background.color=$TRANSPARENT
  scroll_texts=on
  icon=z
  label="Sleep"
  click_script="pmset sleepnow; $POPUP_OFF"
)

logo_restart=(
  label.font="$FONT:Regular:12"
  padding_left=6
  padding_right=6
  icon.padding_left=0
  icon.padding_right=4
  icon.color=$HIGHLIGHT
  background.color=$TRANSPARENT
  scroll_texts=on
  icon=r
  label="Restart…"
  click_script="osascript -e 'tell app \"loginwindow\" to «event aevtrrst»'; $POPUP_OFF"
)

logo_shutdown=(
  label.font="$FONT:Regular:12"
  padding_left=6
  padding_right=6
  icon.padding_left=0
  icon.padding_right=4
  icon.color=$HIGHLIGHT
  background.color=$TRANSPARENT
  scroll_texts=on
  icon=d
  label="Shut Down…"
  click_script="osascript -e 'tell app \"loginwindow\" to «event aevtrsdn»'; $POPUP_OFF"
)

logo_lockscreen=(
  label.font="$FONT:Regular:12"
  padding_left=6
  padding_right=6
  icon.padding_left=0
  icon.padding_right=4
  icon.color=$HIGHLIGHT
  background.color=$TRANSPARENT
  scroll_texts=on
  icon=l
  label="Lock Screen"
  click_script="osascript -e 'tell application \"System Events\" to keystroke \"q\" using {command down,control down}'; $POPUP_OFF"
)

logo_logout=(
  label.font="$FONT:Regular:12"
  padding_left=6
  padding_right=6
  icon.padding_left=0
  icon.padding_right=4
  icon.color=$HIGHLIGHT
  background.color=$TRANSPARENT
  scroll_texts=on
  icon=o
  label="Log Out ${USER}…"
  click_script="osascript -e 'tell app \"System Events\" to log out'; $POPUP_OFF"
)

logo_refresh=(
  label.font="$FONT:Regular:12"
  padding_left=6
  padding_right=6
  icon.padding_left=0
  icon.padding_right=4
  icon.color=$HIGHLIGHT
  background.color=$TRANSPARENT
  scroll_texts=on
  icon=s
  label="Refresh Sketchybar"
  click_script="$POPUP_OFF; sketchybar --update"
  # script="sketchybar --update"
  # update_freq=86400
  # updates=on
)

sketchybar \
  --add item logo left \
  --set logo "${logo[@]}" \
  \
  --add item logo.about popup.logo \
  --set logo.about "${logo_about[@]}" \
  \
  --add item logo.settings popup.logo \
  --set logo.settings "${logo_settings[@]}" \
  \
  --add item logo.sleep popup.logo \
  --set logo.sleep "${logo_sleep[@]}" \
  \
  --add item logo.restart popup.logo \
  --set logo.restart "${logo_restart[@]}" \
  \
  --add item logo.shut_down popup.logo \
  --set logo.shut_down "${logo_shutdown[@]}" \
  \
  --add item logo.lock_screen popup.logo \
  --set logo.lock_screen "${logo_lockscreen[@]}" \
  \
  --add item logo.logout popup.logo \
  --set logo.logout "${logo_logout[@]}" \
  \
  --add item logo.refresh popup.logo \
  --set logo.refresh "${logo_refresh[@]}"
