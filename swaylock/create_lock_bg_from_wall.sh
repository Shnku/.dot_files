#!/bin/bash

# Take current wallpaper and set it as lockscreen background of swaylock.
# depends on azote.
# can change autometically if modified.

AZOTE=~/.azotebg
STORE=~/.config/swaylock/current_wall.txt
STOREVAL=$(cat $STORE)
echo "current sore value === $STOREVAL"

#WALL=$(awk '{print $5}' $AZOTE)
#WALL2=$(echo $WALL | sed 's/\"/ /g')

WALL=$(grep -oP -- '-i\s*"\K[^"]+' $AZOTE)
echo "is changed === $WALL"

if [[ $STOREVAL == "$WALL" ]]; then
  echo "---not executed--- no wallpaper changed"
else
  echo "---else part--- wallpaper changed"
  echo "$WALL" >"$STORE"
  echo "done filewrite>> $WALL"

  BG=~/.config/swaylock/lockscreen.png
  magick "$WALL" -resize 1366x768 -blur 2x8 -modulate 35 $BG
fi
