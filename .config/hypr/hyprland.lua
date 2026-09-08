-- Hyprland Lua Configuration
-- Reference: https://wiki.hypr.land/Configuring/Start/

---------------------------------
---- MODULAR CONFIG IMPORTS -----
---------------------------------

require("config.monitor")
require("config.autostart")
require("config.env")
require("config.input")
require("config.gesture")
require("config.animation")
require("config.windows")
require("config.keybindings")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- See https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,

        border_size = 2,

        col = {
            active_border   = { colors = { "rgba(8aadf4ee)", "rgba(ed8796ee)" }, angle = 45 },
            inactive_border = "rgba(5b6078aa)",
        },

        -- Resize windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Tearing support
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding = 12,

        -- Transparency of focused and unfocused windows
        active_opacity   = 0.95,
        inactive_opacity = 0.85,

        blur = {
            enabled           = true,
            size              = 6,
            passes            = 3,
            new_optimizations = true,
            vibrancy          = 0.1696,
            ignore_opacity    = true,
            xray              = false,
        },

        shadow = {
            enabled      = true,
            range        = 15,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
        },
    },

    dwindle = {
        preserve_split = true,
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
        disable_splash_rendering= true,
        vrr                     = 1,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms  = true,
    },

    render = {
        direct_scanout = true,
    },

    ecosystem = {
        no_donation_nag = true,
    },

    xwayland = {
        force_zero_scaling = true,
    },
})
