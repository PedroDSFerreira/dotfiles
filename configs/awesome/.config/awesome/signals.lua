-- Client Signals Configuration
-- Returns client lifecycle events and focus management setup

local awful = require("awful")
local beautiful = require("beautiful")

-- Client management signal
local function setup_client_management()
    client.connect_signal("manage", function(c)
        -- Prevent clients from being unreachable after screen changes
        if awesome.startup and 
           not c.size_hints.user_position and 
           not c.size_hints.program_position then
            awful.placement.no_offscreen(c)
        end
    end)
end

-- Focus management signals
local function setup_focus_management()
    -- Visual feedback for focused clients
    client.connect_signal("focus", function(c)
        c.border_color = beautiful.border_focus
    end)
    
    -- Visual feedback for unfocused clients
    client.connect_signal("unfocus", function(c)
        c.border_color = beautiful.border_normal
    end)
end

-- Optional: Sloppy focus (focus follows mouse)
local function setup_sloppy_focus()
    -- client.connect_signal("mouse::enter", function(c)
    --     c:emit_signal("request::activate", "mouse_enter", { raise = false })
    -- end)
end

-- Return signals configuration
return {
    -- Setup function to be called by rc.lua
    setup = function()
        setup_client_management()
        setup_focus_management()
        setup_sloppy_focus()
    end,
    
    -- Individual setup functions for granular control
    setup_client_management = setup_client_management,
    setup_focus_management = setup_focus_management,
    setup_sloppy_focus = setup_sloppy_focus
}
