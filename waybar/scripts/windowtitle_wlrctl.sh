#! /bin/bash
# waybar doesnot provide lavwc/window like sway/window or hyprland/window
# so, it uses wlrctl to manually get the window title of current active window.

full_description=$(wlrctl window list state:active)
echo ${full_description%%:*}
