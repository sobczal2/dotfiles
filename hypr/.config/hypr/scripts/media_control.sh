#!/bin/bash
music_icon="$HOME/.config/swaync/icons/music.png"

play_next() {
    playerctl next
}

play_previous() {
    playerctl previous
}

toggle_play_pause() {
    playerctl play-pause
}

# Stop playback
stop_playback() {
    playerctl stop
}

case "$1" in
"--next")
    play_next
    ;;
"--previous")
    play_previous
    ;;
"--pause")
    toggle_play_pause
    ;;
"--stop")
    stop_playback
    ;;
*)
    echo "Usage: $0 [--next|--previous|--pause|--stop]"
    exit 1
    ;;
esac
