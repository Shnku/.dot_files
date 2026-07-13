#!/bin/bash

BG=~/.config/swaylock/lockscreen.png
grim $BG
magick $BG \
  -modulate 40 \
  -blur 6x8 \
  $BG
