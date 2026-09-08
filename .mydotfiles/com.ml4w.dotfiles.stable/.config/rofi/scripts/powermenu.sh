#!/usr/bin/env bash

# Clean Action List with distinct icons
lock="    Lock Screen"
sleep_opt="󰒲    Sleep"
logout="󰍃    Log Out ${USER}…"
restart="󰜉    Restart…"
shutdown="    Shut Down…"
cancel="󰅖    Cancel"

# System metadata
uptime_val=$(uptime -p | sed -e 's/up //g')

# Format options
options="${lock}\n${sleep_opt}\n${logout}\n${restart}\n${shutdown}\n${cancel}"

chosen=$(echo -e "$options" | rofi -dmenu \
    -theme ~/.config/rofi/config-power.rasi \
    -p "󰣇   Power Session" \
    -mesg "System Uptime: ${uptime_val}" \
    -selected-row 0 \
    -click-to-exit)

case "$chosen" in
    "$lock")
        hyprlock
        ;;
    "$sleep_opt")
        systemctl suspend-then-hibernate || systemctl suspend
        ;;
    "$logout")
        command -v uwsm >/dev/null 2>&1 && uwsm stop || hyprctl dispatch exit
        ;;
    "$restart")
        systemctl reboot
        ;;
    "$shutdown")
        systemctl poweroff
        ;;
    "$cancel")
        exit 0
        ;;
esac
