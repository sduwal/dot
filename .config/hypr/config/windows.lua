--------------------------------
---- WINDOWS AND LAYER RULES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- Use `hyprctl clients` to look for window class

-- Floating rules
hl.window_rule({ match = { class = "jome" }, float = true })
hl.window_rule({ match = { class = "kvantummanager" }, float = true })
hl.window_rule({ match = { class = "qt5ct" }, float = true })
hl.window_rule({ match = { class = "qt6ct" }, float = true })
hl.window_rule({ match = { class = "nwg-look" }, float = true })
hl.window_rule({ match = { class = "org.kde.ark" }, float = true })
hl.window_rule({ match = { class = "pavucontrol" }, float = true })
hl.window_rule({ match = { class = "blueman-manager" }, float = true })
hl.window_rule({ match = { class = "nm-applet" }, float = true })
hl.window_rule({ match = { class = "nm-connection-editor" }, float = true })
hl.window_rule({ match = { class = "org.kde.polkit-kde-authentication-agent-1" }, float = true })

-- Opacity rules
hl.window_rule({ match = { class = "Thorium-browser" }, opacity = "0.90 0.90" })
hl.window_rule({ match = { class = "Code" }, opacity = "0.80 0.80" })
hl.window_rule({ match = { class = "Arduino IDE" }, opacity = "0.80 0.80" })
hl.window_rule({ match = { class = "dev.warp.Warp" }, opacity = "0.80 0.80" })
hl.window_rule({ match = { class = "obsidian" }, opacity = "0.80 0.80" })
hl.window_rule({ match = { class = "code-url-handler" }, opacity = "0.80 0.80" })
hl.window_rule({ match = { class = "code-insiders-url-handler" }, opacity = "0.80 0.80" })
hl.window_rule({ match = { class = "kitty" }, opacity = "0.80 0.80" })
hl.window_rule({ match = { class = "org.gnome.Nautilus" }, opacity = "0.80 0.80" })
hl.window_rule({ match = { class = "org.kde.ark" }, opacity = "0.80 0.80" })
hl.window_rule({ match = { class = "nwg-look" }, opacity = "0.80 0.80" })
hl.window_rule({ match = { class = "qt5ct" }, opacity = "0.80 0.80" })
hl.window_rule({ match = { class = "qt6ct" }, opacity = "0.80 0.80" })
hl.window_rule({ match = { class = "kvantummanager" }, opacity = "0.80 0.80" })
hl.window_rule({ match = { class = "pavucontrol" }, opacity = "0.80 0.70" })
hl.window_rule({ match = { class = "blueman-manager" }, opacity = "0.80 0.70" })
hl.window_rule({ match = { class = "nm-applet" }, opacity = "0.80 0.70" })
hl.window_rule({ match = { class = "Spotify" }, opacity = "0.70 0.70" })
hl.window_rule({ match = { class = "nm-connection-editor" }, opacity = "0.80 0.70" })
hl.window_rule({ match = { class = "org.kde.polkit-kde-authentication-agent-1" }, opacity = "0.80 0.70" })
hl.window_rule({ match = { class = "polkit-gnome-authentication-agent-1" }, opacity = "0.80 0.70" })
hl.window_rule({ match = { class = "org.freedesktop.impl.portal.desktop.gtk" }, opacity = "0.80 0.70" })
hl.window_rule({ match = { class = "org.freedesktop.impl.portal.desktop.hyprland" }, opacity = "0.80 0.70" })

-- Layer rules
hl.layer_rule({ match = { namespace = "waybar" }, blur = true, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, animation = "slide right" })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, animation = "slide" })
hl.layer_rule({ match = { namespace = "tofi" }, blur = true, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "dunst" }, blur = true, ignore_alpha = 0 })
