-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
    -- DBus activation environment
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- Polkit authentication agent
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")

    -- Notifications & status bar
    hl.exec_cmd("swaync")
    hl.exec_cmd("waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css")

    -- Wallpaper daemons & script
    hl.exec_cmd("swww-daemon")
    hl.exec_cmd("~/.config/hypr/scripts/wallpaper_timer.sh")

    -- Clipboard history
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Idle & lock / paper
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprpaper")

    -- Workspace manager
    hl.exec_cmd("python3 ~/.config/hypr/scripts/workspace_manager.py")

    -- SwayNC volume sync
    hl.exec_cmd("~/.config/swaync/scripts/volume_control.sh --watch")
end)
