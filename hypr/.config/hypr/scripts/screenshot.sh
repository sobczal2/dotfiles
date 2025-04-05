#!/bin/bash

time=$(date "+%d-%b_%H-%M-%S")
file="$(xdg-user-dir)/Pictures/Screenshots/screenshot_${time}_${RANDOM}.png"

notify() {
    resp=$(timeout 5 notify-send -t 5000 \
        -A action1=Open \
        -h string:x-canonical-private-synchronous:shot-notify \
        "Screenshot taken")

    case "$resp" in
    action1) feh "$file" & ;;
    esac
}

shotnow() {
    grim - | tee "$file" | wl-copy
    notify
}

shotarea() {
    grim -g "$(slurp)" - | tee "$file" | wl-copy
    notify
}

shotactive() {
    hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | grim -g - | tee "$file" | wl-copy
    notify
}

if [[ "$1" == "--now" ]]; then
    shotnow
elif [[ "$1" == "--area" ]]; then
    shotarea
elif [[ "$1" == "--active" ]]; then
    shotactive
else
    echo -e "Available Options : --now --area --active"
fi

exit 0
