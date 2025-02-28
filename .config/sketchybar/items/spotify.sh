#!/bin/sh

sketchybar --add item spotify right                                  \
           --set spotify                                             \
           icon=♫                                                    \
           label.max_chars=24                                        \
           scroll_texts=on                                           \
           label.scroll_duration=150                                 \
           label.align=center                                        \
           click_script="$PLUGIN_DIR/spotify_player.sh"
