#!/bin/bash
declare -A resolutions=(
    [2160]=450
    [1440]=450
    [1080]=350
)

if pgrep -x "wlogout" >/dev/null; then
    exit 0
fi

monitor_info=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true)')
resolution=$(echo "$monitor_info" | jq -r '.height')
width=$(echo "$monitor_info" | jq -r '.width')
hypr_scale=$(echo "$monitor_info" | jq -r '.scale')

if [[ -z "$resolution" || ! "$resolution" =~ ^[0-9]+$ || -z "$hypr_scale" || $(awk "BEGIN {exit !($hypr_scale >= 1.25)}") -eq 1 ]]; then
    wlogout --protocol layer-shell -b 3 -T 100 -B 100 &
    exit 0
fi

if ((resolution >= 2160)); then
    res_key=2160
elif ((resolution >= 1600)); then
    res_key=1600
elif ((resolution >= 1440)); then
    res_key=1440
elif ((resolution >= 1080)); then
    res_key=1080
else
    res_key=720
fi

T_val=$(awk "BEGIN {printf \"%.0f\", ${resolutions[$res_key]} * $res_key * $hypr_scale / $resolution}")
B_val=$(awk "BEGIN {printf \"%.0f\", ${resolutions[$res_key]} * $res_key * $hypr_scale / $resolution}")

wlogout --protocol layer-shell -b 6 -T $T_val -B $B_val &
