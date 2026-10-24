#!/bin/bash

statusBat1="$(cat /sys/class/power_supply/BAT0/status)"
statusBat2="$(cat /sys/class/power_supply/BAT1/status)"
capacity="$(cat /sys/class/power_supply/BAT0/capacity)"

if [[ $statusBat1 != "Charging" && $statusBat2 != "Charging" && $capacity -lt 20 ]]; then
	/usr/bin/notify-send -t 10000 "Battery ${capacity}%" --category BATTERY
fi
