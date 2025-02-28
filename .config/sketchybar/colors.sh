#!/bin/bash
# set -x

getcolor() {
  COLOR_NAME=$1
  OPACITY=$2
  local COLOR=""

  if [[ -z $OPACITY ]]; then
    OPACITY=100
  fi

  # Rose Pine https://rosepinetheme.com/palette/ingredients/
  COLORS=(
    blue "#89b4fa"
    teal "#94e2d5"
    cyan "#74c7ec"
    grey "#9399b2"
    green "#a9b665"
    yellow "#ebbcba"
    orange "#fab387"
    red "#ea6962"
    purple "#d3869b"
    black "#1e1e2e"
    trueblack "#000000"
    white "#e0def4"
  )

  # Loop through the array to find the color hex by name
  for ((i = 0; i < ${#COLORS[@]}; i += 2)); do
    if [[ "${COLORS[i]}" == "$COLOR_NAME" ]]; then
      COLOR="${COLORS[i + 1]}"
      break
    fi
  done

  # Check if color was found
  if [[ -z $COLOR ]]; then
    echo "Invalid color name: $COLOR_NAME" >&2
    return 1
  fi

  echo $(PERCENT2HEX $OPACITY)${COLOR:1}
}

PERCENT2HEX() {
  local PERCENTAGE=$1
  local DECIMAL=$(((PERCENTAGE * 255) / 100))
  printf "0x%02X\n" "$DECIMAL"
}

# Color Tokens
export BAR_COLOR=$(getcolor black 0)
export BAR_BORDER_COLOR=$(getcolor black 0)
export HIGHLIGHT=$(getcolor purple)
export HIGHLIGHT_75=$(getcolor purple 75)
export HIGHLIGHT_50=$(getcolor purple 0)
export HIGHLIGHT_25=$(getcolor purple 25)
export HIGHLIGHT_10=$(getcolor purple 0)
export ICON_COLOR=$(getcolor white)
export ICON_COLOR_INACTIVE=$(getcolor white 50)
export LABEL_COLOR=$(getcolor white)
export POPUP_BACKGROUND_COLOR=$(getcolor black 25)
export POPUP_BORDER_COLOR=$(getcolor black 0)
export SHADOW_COLOR=$(getcolor black)
export TRANSPARENT=$(getcolor black 0)

# Material Darker
# local blue=#82aaff
# local teal=#64ffda
# local cyan=#89ddff
# local grey=#3b4252
# local green=#c3e88d
# local yellow=#ffcb6b
# local orange=#f78c6c
# local red=#ff5370
# local purple=#c792ea
# local black=#0f111a
# local white=#eeeeee

# Tokyo Night
# local blue=#7dcfff
# local teal=#73daca
# local cyan=#b4f9f8
# local grey=#565f89
# local green=#9ece6a
# local yellow=#e0af68
# local orange=#ff9e64
# local red=#f7768e
# local purple=#bb9af7
# local black=#1a1b26
# local white=#cfc9c2
