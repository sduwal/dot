------------------
---- GESTURES ----
------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/

hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
    scale     = 4.0,
})

hl.gesture({
    fingers   = 4,
    direction = "up",
    action    = "fullscreen",
})

hl.gesture({
    fingers   = 4,
    direction = "down",
    action    = "fullscreen",
})
