#! /bin/sh

DIM=$(slurp -d)
grim -g "$DIM" - | wl-copy
dunstify "Screenshot Captured" -t 800
