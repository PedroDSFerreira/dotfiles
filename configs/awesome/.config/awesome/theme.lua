-- Theme Configuration
-- Returns theme settings to be applied by rc.lua

local gears = require("gears")
local beautiful = require("beautiful")

-- Theme constants
local THEME_CONFIG = {
    gaps = 5,
    padding = { top = 39 }
}

-- Return theme configuration
return {
    -- Theme initialization function
    init = function()
        -- Load base theme
        beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
        
        -- Apply custom spacing
        beautiful.useless_gap = THEME_CONFIG.gaps
        beautiful.padding = THEME_CONFIG.padding
    end,
    
    -- Theme settings for external access
    config = THEME_CONFIG
}
