--------------------
---- ANIMATIONS ----
--------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.1 } } })
hl.curve("cubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0 }, { 0.35, 1 } } })

hl.animation({ leaf = "windows",     enabled = true, speed = 7, bezier = "overshot",       style = "slide" })
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 7, bezier = "overshot",       style = "slide" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 6, bezier = "easeInOutCubic", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 7, bezier = "overshot",       style = "slide" })
hl.animation({ leaf = "fade",        enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 5, bezier = "overshot",       style = "slide" })
