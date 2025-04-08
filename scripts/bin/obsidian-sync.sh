#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Error: No argument provided"
    echo "Usage: $0 push|pull"
    exit 1
fi

case "$1" in
"push")
    rclone sync --interactive ~/Documents/Obsidian/ google-drive:Obsidian
    ;;
"pull")
    rclone sync --interactive google-drive:Obsidian ~/Documents/Obsidian/
    ;;
*)
    echo "Invalid argument: $1"
    echo "Usage: $0 push|pull"
    exit 1
    ;;
esac

exit 0
