#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Wallpaper"

# Wait for hyprpaper to start
while ! pgrep -x "hyprpaper" > /dev/null; do
    sleep 1
done

PREVIOUS_WALLPAPER=""

while true; do
    # Get a list of all images in the directory
    WALLPAPERS=($(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.webp" \)))

    # Check if there are any wallpapers
    if [ ${#WALLPAPERS[@]} -eq 0 ]; then
        echo "No wallpapers found in $WALLPAPER_DIR"
        sleep 10
        continue
    fi

    # Pick a random wallpaper different from the previous one
    while true; do
        RANDOM_WALLPAPER=${WALLPAPERS[$RANDOM % ${#WALLPAPERS[@]}]}
        if [ "${#WALLPAPERS[@]}" -le 1 ] || [ "$RANDOM_WALLPAPER" != "$PREVIOUS_WALLPAPER" ]; then
            break
        fi
    done

    # Set the wallpaper using hyprpaper
    # 1. Preload the new wallpaper
    hyprctl hyprpaper preload "$RANDOM_WALLPAPER"
    
    # 2. Set it as the wallpaper for all monitors (empty monitor name)
    hyprctl hyprpaper wallpaper ",$RANDOM_WALLPAPER"
    
    # 3. Unload the previous wallpaper to save memory
    if [ -n "$PREVIOUS_WALLPAPER" ]; then
        hyprctl hyprpaper unload "$PREVIOUS_WALLPAPER"
    fi

    PREVIOUS_WALLPAPER="$RANDOM_WALLPAPER"

    # Wait for 1 hour
    sleep 3600
done
