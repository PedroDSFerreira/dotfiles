-- Autostart Configuration
-- Returns application startup configuration

local awful = require("awful")

-- Configuration
local AUTOSTART_CONFIG = {
    script_path = "~/.scripts/autostart.sh"
}

-- Return autostart configuration
return {
    config = AUTOSTART_CONFIG,
    
    -- Execute autostart function
    run = function()
        awful.spawn.with_shell(AUTOSTART_CONFIG.script_path)
    end
}
