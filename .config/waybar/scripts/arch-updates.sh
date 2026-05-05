#!/bin/bash

# Check for pacman updates
if command -v checkupdates &> /dev/null; then
    updates_arch=$(checkupdates 2>/dev/null | wc -l)
else
    updates_arch=0
fi

# Check for AUR updates (paru or yay)
if command -v paru &> /dev/null; then
    updates_aur=$(paru -Qum 2>/dev/null | wc -l)
elif command -v yay &> /dev/null; then
    updates_aur=$(yay -Qum 2>/dev/null | wc -l)
else
    updates_aur=0
fi

updates=$((updates_arch + updates_aur))

# Define thresholds for color classes
css_class="green"
if [ "$updates" -gt 50 ]; then
    css_class="red"
elif [ "$updates" -gt 25 ]; then
    css_class="yellow"
fi

# Output JSON for Waybar
if [ "$updates" -ge 0 ]; then
    if [ "$updates" -gt 0 ]; then
        printf '{"text": "%s", "alt": "%s", "tooltip": "%s Updates Available", "class": "%s"}\n' "$updates" "$updates" "$updates" "$css_class"
    else
        printf '{"text": "0", "alt": "0", "tooltip": "System is up to date", "class": "green"}\n'
    fi
fi
