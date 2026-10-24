#! /bin/bash

image="/home/konrad/$(date +'%m-%d-%Y-%H%M%S')_TMP.png"

grim -g "$(slurp)" $image
hex=$(magick "$image" -scale 1x1\! -format "#%[hex:p{0,0}]" info: 2>/dev/null || echo "#??????")
notify-send "Color: ${hex}"  --category COLOR
wl-copy "$hex"
rm $image
