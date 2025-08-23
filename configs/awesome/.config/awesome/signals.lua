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

-- Polybar fullscreen management
local function setup_polybar_fullscreen_management()
    -- Function to check if any client is fullscreen
    local function is_any_client_fullscreen()
        for _, c in ipairs(client.get()) do
            if c.fullscreen and c:isvisible() then
                return true
            end
        end
        return false
    end
    
    -- Function to manage polybar visibility
    local function manage_polybar_visibility()
        if is_any_client_fullscreen() then
            -- Hide polybar when any client is fullscreen
            awful.spawn.with_shell("killall -q polybar")
            awful.spawn.with_shell("polybar-msg cmd quit")
        else
            -- Restore polybar when no clients are fullscreen
            awful.spawn.with_shell("pgrep polybar > /dev/null || (polybar mybar 2>&1 | tee -a /tmp/polybar.log &)")
        end
    end
    
    -- Connect signals for fullscreen changes
    client.connect_signal("property::fullscreen", function(c)
        manage_polybar_visibility()
    end)
    
    -- Also handle when clients are managed/unmanaged
    client.connect_signal("manage", function(c)
        manage_polybar_visibility()
    end)
    
    client.connect_signal("unmanage", function(c)
        manage_polybar_visibility()
    end)
    
    -- Handle when clients become visible/invisible
    client.connect_signal("property::hidden", function(c)
        manage_polybar_visibility()
    end)
    
    client.connect_signal("property::minimized", function(c)
        manage_polybar_visibility()
    end)
    
    -- Handle screen/tag changes that might affect fullscreen visibility
    client.connect_signal("tagged", function(c)
        if c.fullscreen then
            manage_polybar_visibility()
        end
    end)
    
    client.connect_signal("untagged", function(c)
        if c.fullscreen then
            manage_polybar_visibility()
        end
    end)
end

-- Return signals configuration
return {
    -- Setup function to be called by rc.lua
    setup = function()
        setup_client_management()
        setup_focus_management()
        setup_sloppy_focus()
        setup_polybar_fullscreen_management()
    end,
    
    -- Individual setup functions for granular control
    setup_client_management = setup_client_management,
    setup_focus_management = setup_focus_management,
    setup_sloppy_focus = setup_sloppy_focus,
    setup_polybar_fullscreen_management = setup_polybar_fullscreen_management
}
