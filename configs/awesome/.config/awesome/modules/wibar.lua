-- Wibar and Screen Configuration
-- Returns screen setup configuration

local awful = require("awful")

-- Configuration constants
local WIBAR_CONFIG = {
    position = "top",
    height = 28,
    opacity = 0
}

local SCREEN_CONFIG = {
    primary_tags = { "1", "2", "3", "4", "5" },
    secondary_tags = { "6", "7", "8", "9" }
}

-- Return wibar and screen configuration
return {
    config = {
        wibar = WIBAR_CONFIG,
        screen = SCREEN_CONFIG
    },
    
    -- Setup function to be called by rc.lua
    setup = function()
        -- Setup invisible wibar for polybar integration
        awful.wibar({
            position = WIBAR_CONFIG.position,
            height = WIBAR_CONFIG.height,
            opacity = WIBAR_CONFIG.opacity,
        })

        -- Handle screen geometry changes
        screen.connect_signal("property::geometry", function(s)
            awful.spawn_with_shell("xrandr --auto")
        end)

        -- Configure tags for each screen
        awful.screen.connect_for_each_screen(function(s)
            local tags, layout
            
            if s.index == 1 then
                -- Primary screen: tags 1-5
                tags = SCREEN_CONFIG.primary_tags
            elseif s.index == 2 then
                -- Secondary screen: tags 6-9
                tags = SCREEN_CONFIG.secondary_tags
            else
                -- Fallback for additional screens
                tags = { tostring(s.index) }
            end
            
            layout = awful.layout.layouts[1] -- Default to first layout
            awful.tag(tags, s, layout)
        end)
    end
}
