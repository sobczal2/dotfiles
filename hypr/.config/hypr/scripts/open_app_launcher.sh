#!/bin/bash

if pgrep -x rofi >/dev/null; then
    exit 0
fi

rofi -show drun -modi drun,filebrowser,run,window
