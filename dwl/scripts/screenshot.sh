#!/bin/bash

image="/home/konrad/$(date +'%m-%d-%Y-%H%M%S').png"

if [[ $1 == "selection" ]]; then
	grim -g "$(slurp)" $image
else
	grim $image

fi

notify-send "Screenshot saved at ${image}" --category SCREENSHOT 
