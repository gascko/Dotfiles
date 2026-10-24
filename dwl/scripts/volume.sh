#!/bin/bash

if [[ $1 == "up" ]]; then
	pulsemixer --change-volume +10
elif [[ $1 == "down" ]]; then
	pulsemixer --change-volume -10
elif [[ $1 == "mute" ]]; then
	pulsemixer --toggle-mute
fi

volume=$(pulsemixer --get-volume | awk '{ print $1 }')
mute=$(pulsemixer --get-mute)

if [[ $mute == 1 ]]; then
	notify-send "Muted" --category=VOLUME 
else
	notify-send "" --category=VOLUME --hint=INT:value:$volume 
fi
