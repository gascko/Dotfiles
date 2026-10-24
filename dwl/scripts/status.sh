#!/bin/bash

capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
ssid="$(nmcli -t -f NAME c show --active | grep -v lo)"
statusBat2="$(cat /sys/class/power_supply/BAT1/status)"

notify-send --category "STATUS" "$(date +%H:%M) Uhr" 
notify-send --category "STATUS" "${capacity}% ${statusBat2}" 
notify-send --category "STATUS" "Connected to ${ssid}" 
