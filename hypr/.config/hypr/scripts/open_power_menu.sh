#!/bin/bash
if pgrep -x "wlogout" >/dev/null; then
    exit 0
fi

wlogout --protocol layer-shell -b 6 -T 450 -B 450 &
