#!/bin/bash
BRIGHTNESS_VALUE=`brightnessctl | grep -o "(.*" | tr -d "()"`
BRIGHTNESS_NR=${BRIGHTNESS_VALUE//%}

ramp=(󰃞 󰃝 󰃟 󰃠)
index=$((BRIGHTNESS_NR * ${#ramp[@]} / 100))
BRIGHTNESS_ICON=${ramp[$index]}

if [ $BRIGHTNESS_NR -eq 100 ]; then
	BRIGHTNESS_ICON=󰃡
fi

echo "$BRIGHTNESS_ICON $BRIGHTNESS_VALUE"
