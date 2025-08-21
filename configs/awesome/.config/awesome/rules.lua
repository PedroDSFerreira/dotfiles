-- Window Rules Configuration
-- Returns rules and properties for window management

local awful = require("awful")
local beautiful = require("beautiful")

-- Default rule for all clients
local function create_default_rule(clientkeys, clientbuttons)
    return {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
        },
    }
end

-- Special application rules
local function create_special_rules()
    return {
        -- Webcam overlay (always on top, floating)
        {
            rule = {
                class = "mpv",
                name = "webcam",
            },
            properties = {
                floating = true,
                sticky = true,
                ontop = true,
                placement = function(c)
                    awful.placement.bottom_right(c, { margins = { right = 3, bottom = 3 } })
                end,
            },
        },

        -- Centered floating clients
        {
            rule_any = {
                class = { "Notepadqq", "feh" },
            },
            properties = {
                floating = true,
                maximized = false,
                placement = awful.placement.centered,
            },
        },

        -- Widget windows (floating, always on top)
        {
            rule_any = {
                instance = { "widget" },
            },
            properties = {
                floating = true,
                ontop = true,
                sticky = true,
                placement = awful.placement.centered,
            },
        },

        -- System dialogs and utilities
        {
            rule_any = {
                instance = {
                    "copyq",    -- Clipboard manager
                    "pinentry", -- GPG password entry
                },
                class = {
                    "Arandr",           -- Display settings
                    "Blueman-manager",  -- Bluetooth manager
                    "Gpick",           -- Color picker
                    "Kruler",          -- Screen ruler
                    "Sxiv",            -- Image viewer
                    "Wpa_gui",         -- WiFi GUI
                    "veromix",         -- Audio mixer
                    "xtightvncviewer", -- VNC viewer
                },
                name = {
                    "Event Tester", -- xev
                },
                role = {
                    "AlarmWindow",  -- Thunderbird calendar
                    "ConfigManager", -- Thunderbird about:config
                    "pop-up",       -- Browser developer tools
                },
            },
            properties = { 
                floating = true, 
                placement = awful.placement.closest_corner 
            },
        },

        -- Browsers (disable default maximized state)
        {
            rule_any = {
                class = { "Firefox", "Brave-browser" },
            },
            properties = {
                maximized = false,
                floating = false,
            },
        },
    }
end

-- Combine all rules
local function create_all_rules(clientkeys, clientbuttons)
    local rules = { create_default_rule(clientkeys, clientbuttons) }
    
    -- Add special rules
    for _, rule in ipairs(create_special_rules()) do
        table.insert(rules, rule)
    end
    
    return rules
end

-- Return rules configuration
return {
    -- Create rules function
    create_rules = create_all_rules,
    
    -- Apply function to be called by rc.lua
    apply = function(clientkeys, clientbuttons)
        awful.rules.rules = create_all_rules(clientkeys, clientbuttons)
    end
}
