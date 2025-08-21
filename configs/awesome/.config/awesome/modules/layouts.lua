-- Layout Configuration
-- Returns available window layouts

local awful = require("awful")

-- Available layouts in order of preference
local LAYOUTS = {
    awful.layout.suit.tile,        -- Tiled layout (main + stack)
    awful.layout.suit.max,         -- Maximized layout
    awful.layout.suit.tile.bottom, -- Tiled with bottom stack
    awful.layout.suit.magnifier,   -- Magnifier layout
}

-- Return layout configuration
return {
    layouts = LAYOUTS,
    
    -- Apply layouts function
    apply = function()
        awful.layout.layouts = LAYOUTS
    end
}
