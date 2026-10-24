#!/bin/bash

if [[ $1 == "up" ]]; then
	brightnessctl set +10%
elif [[ $1 == "down" ]]; then
	brightnessctl set 10%-
fi

brightness=$(brightnessctl get)
maxBrightness=$(brightnessctl max)
brightness=$(((brightness * 100) / maxBrightness))
notify-send "" --category BRIGHTNESS --hint=INT:value:$brightness
